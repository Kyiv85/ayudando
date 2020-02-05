<?php
//Clase para el registro de usuarios
include("../../controllers/email/EmailMG.php");

class RifaController {

	public $error = "";
	

	/**
	* Valida los números ya apartados
	* @return array|false
	*/
	public function validateNumbers(){
		//Realizar la conexión a la base de datos
        $mbd = $this->connect();
        if(!$mbd){
            $this->error = "Hubo un error de conexión con la base de datos, por favor contacta con el administrador";
            return false;
        }
        
        $sql = 'SELECT rifNumero FROM rifNumerosUsuarios';
        
        //Ejecutar la consulta
        try {
            $sth = $mbd->query($sql);
        } catch (PDOException $e) {
            $sth = [];
            error_log("Error al realizar la consulta: " . $e->getMessage());
            $this->error = "Hubo un error validando la información del usuario, por favor contacta con el administrador";
        }
        
        return $sth;
	}
    
    
    /**
     * Registra valores en BD
     * @param array $data Datos a registrar
     * @return bool
     */
    public function procesarValores($data){
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
            $this->error = "Ya existe un usuario registrado con ese correo o ese número de documento";
            error_log("Usuario ".$e['rifCorreo']);
            $mbd = null;
            $exist = null;
            return false;
        }
    
        $mbd->beginTransaction();
    
        //Guardar los datos del usuario
        $this->insertUsuario($mbd,$data);
        if($this->error){
            $mbd->rollBack();
            $mbd = null;
            $exist = null;
            return false;
        }
        
        //Verificar si el usuario se registró en un evento
        if(($data["usuPais"] == "Argentina") && ($data["usuEventos"] == "S")){
            //Relacionar el usuario al evento
            if(!($this->guardarUsuarioEvento($mbd,$this->eveCod))){
                $mbd->rollBack();
                $mbd = null;
                $exist = null;
                return false;
            }
        }
        
        //Enviar el mensaje al usuario y a la cuenta de ayudanos a ayudar
        $data["subject"] = 'Registro generado satisfactoriamente!';
        $data["body"] = '<b>Hola '.$data["usuNombre"].' '.$data["usuApellido"].'!</b>, <br><br><br>Gracias por registrarte en nuestro portal. Esperemos que puedas apoyarnos en brindar ayuda o que podamos ayudarte si lo necesitas. Nos estaremos contactando contigo por esta vía en caso de ser necesario. <br><br>Saludos!.<br>El Equipo de Ayúdanos a Ayudar.';
        $mail = EmailMG::sendEmail($data);
        if(!($mail)){
            $this->error = "El usuario se registró satisfactoriamente, pero hubo un error al enviar el correo de confirmación. Por favor contacta con el administrador";
            $mbd->commit();
            $mbd = null;
            $exist = null;
            return false;
        }
        
        
        //Se commitea y se cierran las conexiones si to tá bien
        $mbd->commit();
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
		$sql = 'SELECT *';
        $sql .= ' FROM rifUsuarios';
        $sql .= ' WHERE ((rifCorreo="'.$data["rifCorreo"].'")';
        $sql .= ' OR ((rifNumDocumento='.$data["rifNumDocumento"].')';
        $sql .= ' AND (rifDocumento='.$data["rifDocumento"].')))';
		
		//Ejecutar la consulta
		try {
            $sth = $mbd->query($sql);
      
        } catch (PDOException $e) {
    	    $sth = [];
            error_log("Error al realizar la consulta: " . $e->getMessage());
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
          $this->usuID = $mbd->lastInsertId();
          
        } catch (PDOException $e) {
            $sth = [];
          error_log("Error al realizar el insert en ayuUsuarios: " . $e->getMessage());
          $this->error = "Hubo un error al guardar la información del usuario, por favor contacta con el administrador";
     
        }
    
        return $sth;
	}
  
  
  
  /**
   * Verifica si ya existe un usuario asociado a un evento en la BD
   * @param object $mbd Objeto con la conexión a la BD
   * @param int $eveCod Código del evento
   * @return array
   */
  private function existeUsuarioEvento($mbd,$eveCod){
    //Hacer un select count de los datos
    $sql = 'SELECT *';
    $sql .= ' FROM ayuUsuariosEventos';
    $sql .= ' WHERE usuCod='.$this->usuID;
    $sql .= ' AND eveCod='.$eveCod;
    
    //Ejecutar la consulta
    try {
      
      $sth = $mbd->query($sql);
      
    } catch (PDOException $e) {
      $sth = [];
      error_log("Error al realizar la consulta: " . $e->getMessage());
      $this->error = "Hubo un error validando la información del usuario, por favor contacta con el administrador";
      
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
    //Verificar si existe el usuario
    $existUserEvent = $this->existeUsuarioEvento($mbd,$eveCod);
    if($this->error != "")
      return false;
    foreach ($existUserEvent as $e){
      $this->existeUserEvent = true;
      return true;
    }
    //Hacer el insert
    $sql = 'INSERT INTO ayuUsuariosEventos(usuCod,eveCod,uevEstado,uevFecAlta)';
    $sql .= ' VALUES ('.$this->usuID.','.$eveCod.',"A",NOW())';
    //Ejecutar la consulta
    try {
      $sth = $mbd->query($sql);
    } catch (PDOException $e) {
      $sth = [];
      error_log("Error al realizar el insert en ayuUsuariosEventos: " . $e->getMessage());
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
      error_log("Error al realizar el insert en ayuCodigosValidacion: " . $e->getMessage());
      $this->error = "Hubo un error al guardar la información del usuario, por favor contacta con el administrador";
    }
	  
    return $sth;
  }
  
  
  private function connect() {
      try {
          $host = "localhost";
          $dbname = "ayudanos";
          $dbuser = "phpmyadmin";
          $dbpass = "Paola1611";
          $charset= "SET NAMES utf8";
          $link = new PDO('mysql:host=' . $host . '; dbname=' . $dbname, $dbuser, $dbpass, array(PDO::MYSQL_ATTR_INIT_COMMAND => $charset));
        
          $link->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
          return $link;
        
      } catch (PDOException $e) {
          $this->error = "Hubo un error de conexión con la base de datos, por favor contacta con el administrador";
          error_log("Error en la conexion: " . $e->getMessage());
          return false;
      }
    
  }

}

?>