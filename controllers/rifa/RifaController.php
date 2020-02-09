<?php
//Clase para el registro de rifas
class RifaController {

	public $error = "";
	
	private $rifUsuID;
	

	/**
	* Valida los números ya apartados
	* @return array|false
	*/
	public function validateNumbers()
    {
		//Realizar la conexión a la base de datos
        $mbd = $this->connect();
        if(!$mbd){
            $this->error = "Hubo un error de conexión con la base de datos, por favor contacta con el administrador";
            return false;
        }
        
        $sql = 'SELECT * FROM rifNumerosUsuarios';
        
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
    public function procesarValores($data)
    {
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
        if(!($this->insertUsuario($mbd,$data))){
            $mbd->rollBack();
            $mbd = null;
            $exist = null;
            return false;
        }
        
        //Relacionar el usuario al evento
        if(!($this->guardarUsuarioNumeros($mbd,$data['rifNumbers']))){
            $mbd->rollBack();
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
	private function existeUsuario($mbd,$data)
    {
		//Hacer un select count de los datos
		$sql = 'SELECT *';
        $sql .= ' FROM rifUsuarios';
        $sql .= ' WHERE ((rifCorreo="'.$data["rifCorreo"].'")';
        $sql .= ' OR ((rifTipoDocumento="'.$data["rifTipoDocumento"].'")';
        $sql .= ' AND (rifNumDocumento='.$data["rifNumDocumento"].')))';
        
		//Ejecutar la consulta
		try {
            $sth = $mbd->query($sql);
      
        } catch (PDOException $e) {
    	    error_log("Error al realizar la consulta: " . $e->getMessage());
            $this->error = "Hubo un error validando la información del usuario, por favor contacta con el administrador";
            return false;
        }
        return $sth;
	}


    /**
    * Guarda los datos del usuario en la BD
    * @param object $mbd Objeto con la conexión a la BD
    * @param array $data Datos del usuario
    * @return bool
    */
	private function insertUsuario($mbd,$data)
    {
		//Hacer el insert
		$sql = 'INSERT INTO rifUsuarios(rifNombre,rifApellido,rifTipoDocumento,rifNumDocumento,rifTelefono,rifCorreo)';
		$sql .= ' VALUES ("'.$data["rifNombre"].'",';
        $sql .= '"'.$data["rifApellido"].'",';
        $sql .= '"'.$data["rifTipoDocumento"].'",';
        $sql .= $data["rifNumDocumento"].',';
        $sql .= $data["rifTelefono"].',';
        $sql .= '"'.$data["rifCorreo"].'")';
        
        //Ejecutar la consulta
        try {
            $sth = $mbd->query($sql);
            $this->rifUsuID = $mbd->lastInsertId();
          
        } catch (PDOException $e) {
            $sth = [];
            error_log("Error al realizar el insert en rifUsuarios: " . $e->getMessage());
            $this->error = "Hubo un error al guardar la información del usuario, por favor contacta con el administrador";
            return false;
        }
    
        return $sth;
	}
  
  
    /**
    * Relaciona un usuario con sus números en BD
    * @param object $mbd Objeto con la conexión a la BD
    * @param string $rifNumbers Números elegidos por el usuario
    * @return bool
    */
    private function guardarUsuarioNumeros($mbd,$rifNumbers)
    {
        $numbers = explode(',',$rifNumbers);
        //Hacer inserts
        foreach ($numbers as $n){
            $sql = 'INSERT INTO rifNumerosUsuarios(rifUsuID,rifNumero)';
            $sql .= ' VALUES ('.$this->rifUsuID.','.$n.')';
            //Ejecutar
            try {
                $sth = $mbd->query($sql);
            } catch (PDOException $e) {
                $sth = [];
                die("Error al realizar el insert en rifNumerosUsuarios: " . $e->getMessage());
                $this->error = "Hubo un error al guardar la información del usuario, por favor contacta con el administrador";
                return false;
            }
        }
        
        return $sth;
    }
  
  
    private function connect()
    {
        try {
            $host = "localhost";
            $dbname = "ayudanos";
            $dbuser = "phpmyadmin";
            $dbpass = "Paola1611.-.-";
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