<?php
//Clase para el registro de usuarios
include("../../models/DBConnect.php");
include("../../controllers/email/EmailMG.php");

class RegistroController extends Conection {

	public $error = "";
	
	private $usuID = null;
	private $codID = null;
	
	
	/********EVENTO SETEADO OJOOOOO ************/
	private $eveCod = 2;
  /********EVENTO SETEADO OJOOOOO ************/

	/**
	* Registra un usuario en BD
	* @param array $data Datos del usuario a registrar
	* @return bool
	*/
	public function registrarUsuario($data){
		//Realizar la conexión a la base de datos
		$mbd = $this->connect();
		if(!($mbd)){
			$this->error = "Hubo un error de conexión con la base de datos, por favor contacta con el administrador";
			return false;
		}

		//Verificar si ya existe un usuario en la BD con dicho documento o correo
		$exist = $this->existeUsuario($mbd,$data);
		if($this->error){
			$mbd = null;
			return false;
		}

		//Si ya existe un usuario mandar un error
		foreach ($exist as $e) {
      if($e["cant"] > 0){
      	$this->error = "Ya existe un usuario registrado con ese correo o ese número de documento";
      	$mbd = null;
      	$exist = null;
      	return false;	
      }
    }

    //Guardar los datos
    $this->insertUsuario($mbd,$data);
    if($this->error){
			return false;
		}
  
		//Verificar si el usuario se registró en un evento
    if(isset($data["usuEventos"]) && ($data["usuEventos"] == "S")){
      //Relacionar el usuario al evento
      if(!($this->guardarUsuarioEvento($mbd,$this->eveCod))){
        $this->error = "Hubo un incoveniente registrando el usuario";
        return false;
      }
    }
    
    //Enviar el mensaje al usuario y a la cuenta de ayudanos a ayudar
    $mail = EmailMG::sendEmail($data);
    if(!($mail)){
      $this->error = "El usuario se registró satisfactoriamente, pero hubo un error al enviar el correo de confirmación. Por favor contacta con el administrador";
      return false;
    }
  

		//Se cierran las conexiones si to tá bien
		$mbd = null;
		$exist = null;

		return true;
	}



	/**
	* Verifica si ya existe un usuario en la BD
	* @param object $mbd Objeto con la conexión a la BD
	* @param array $data Datos del usuario
	* @return array
	*/
	private function existeUsuario($mbd,$data){
		//Hacer un select count de los datos
		$sql = 'SELECT COUNT(*) AS cant';
		$sql .= ' FROM ayuUsuarios';
		$sql .= ' WHERE ((usuEmail="'.$data["usuEmail"].'")';
		$sql .= ' OR ((tipCod='.$data["tipCod"].')';
		$sql .= ' AND (usuDocumento='.$data["usuDocumento"].')))';
		
		//Ejecutar la consulta
		try {
      
      $sth = $mbd->query($sql);
       
    } catch (PDOException $e) {
    	$sth = [];
      error_log("Error al realizar la consulta: " . $e->getLine());
      $this->error = "Hubo un error validando la información del usuario, por favor contacta con el administrador";
 
    }

    return $sth;

	}


  /**
   * Guarda los datos del usuario en la BD
   * @param object $mbd Objeto con la conexión a la BD
   * @param array $data Datos del usuario
   * @return bool
   */
	private function insertUsuario($mbd,$data){
		//Hacer el insert
		$sql = 'INSERT INTO ayuUsuarios(usuEstado,usuNombre,usuApellido,usuEmail,tipCod,usuDocumento,';
		$sql .= 'usuPais,usuDireccion,usuTipo,usuProfesion,usuComentarios)';
		$sql .= ' VALUES ("A","'.$data["usuNombre"].'",';
    $sql .= '"'.$data["usuApellido"].'",';
    $sql .= '"'.$data["usuEmail"].'",';
    $sql .= $data["tipCod"].',';
    $sql .= $data["usuDocumento"].',';
    $sql .= '"'.$data["usuPais"].'",';
    $sql .= '"'.$data["usuDireccion"].'",';
    $sql .= '"'.$data["usuTipo"].'",';
    $sql .= '"'.$data["usuProfesion"].'",';
    if(($data["usuComentarios"] == "") || ($data["usuComentarios"] == NULL)){
    	$usuComentarios = 'NULL';
    }
    else{
    	$usuComentarios = '"'.$data["usuComentarios"].'"';
    }
    $sql .= $usuComentarios.')';
		
		//Ejecutar la consulta
		try {
      
      $sth = $mbd->query($sql);
      $this->usuID = $mbd->insert_id;
       
    } catch (PDOException $e) {
    	$sth = [];
      error_log("Error al realizar el insert en ayuUsuarios: " . $e->getLine());
      $this->error = "Hubo un error al guardar la información del usuario, por favor contacta con el administrador";
 
    }

    return $sth;
	}
  
  
  /**
   * Relaciona un usuario con un evento en BD
   * @param object $mbd Objeto con la conexión a la BD
   * @param int $eveCod Código del evento
   * @return bool
   */
  private function guardarUsuarioEvento($mbd,$eveCod){
    //Hacer el insert
    $sql = 'INSERT INTO ayuUsuariosEventos(usuCod,eveCod,uevEstado,uevFecAlta)';
    $sql .= ' VALUES ('.$this->usuID.','.$eveCod.',"A",NOW())';
    
    //Ejecutar la consulta
    try {
      $sth = $mbd->query($sql);
    } catch (PDOException $e) {
      $sth = [];
      error_log("Error al realizar el insert en ayuUsuariosEventos: " . $e->getLine());
      $this->error = "Hubo un error al guardar la información del usuario, por favor contacta con el administrador";
    }
    
    return $sth;
  }
  
  
  /**
   * Genera un código de validación y lo guarda en BD
   * @param object $mbd Objeto con la conexión a la BD
   * @return bool
   */
	private function generarCodigoValidacion($mbd){
	  //Generar el código
	  $cod = md5(uniqid(rand(), true));
    //Hacer el insert
    $sql = 'INSERT INTO ayuCodigosValidacion(codEstado,codHash,usuCod,codFecAlta)';
    $sql .= ' VALUES ("A","'.$cod.'",'.$this->usuID.',NOW())';
    
    //Ejecutar la consulta
    try {
      $sth = $mbd->query($sql);
      $this->codID = $mbd->insert_id;
      
    } catch (PDOException $e) {
      $sth = [];
      error_log("Error al realizar el insert en ayuCodigosValidacion: " . $e->getLine());
      $this->error = "Hubo un error al guardar la información del usuario, por favor contacta con el administrador";
    }
	  
    return $sth;
  }

}

?>