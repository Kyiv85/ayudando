<?php
//Clase para el registro de usuarios
include("../../models/DBConnect.php");

class RegistroController extends Conection {

	public $error = "";

	/* Registra un usuario en BD
	* @param array $data Datos del usuario a registrar
	* @return bool
	*/
	public function reistrarUsuario($data){
		//Realizar la conexión a la base de datos
		$mbd = $this->connect();
		if(!($mbd)){
			$this->error = "Hubo un error de conexión, por favor contacta con el administrador";
			return false;
		}

		// Utilizar la conexión aquí
		$sth = $mbd->query('SELECT * FROM foo');

		// Ya se ha terminado; se cierra
		$sth = null;
		$mbd = null;

		return true;
	}


}

?>