<?php
//Clase para el envio de emails

class EmailMG {

	/* 
	* Envía el correo de confirmación al usuario
	* @param array $data Datos del usuario
	* @return bool
	*/
	public static function sendEmail($data) {

	  $ch = curl_init();

	  curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
	  curl_setopt($ch, CURLOPT_USERPWD, 'api:key-d815441fa52496e209e486834697fe5c');
	  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

	  curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
	  curl_setopt($ch, CURLOPT_URL, 'https://api.mailgun.net/v3/sandbox617615ac6413468a86859c3cb37fb998.mailgun.org/messages');
	  curl_setopt($ch, CURLOPT_POSTFIELDS, array('from' => 'NO REPLY: Ayúdanos a Ayudar',
	        'to' => $data["usuNombre"].' '.$data["usuApellido"].' <'.$data["usuEmail"].'>',
	        'subject' => 'Registro generado satisfactoriamente!',
	        'text' => '<b>Hola '.$data["usuNombre"].' '.$data["usuApellido"].'!</b>, <br><br><br>Gracias por registrarte en nuestro portal. Esperemos que puedas apoyarnos en brindar ayuda o que podamos ayudarte si lo necesitas. Nos estaremos contactando contigo por esta vía en caso de ser necesario. <br><br>Saludos!.<br>El Equipo de Ayúdanos a Ayudar.'));

	  $j = json_decode(curl_exec($ch));

	  $info = curl_getinfo($ch);

	  if($info['http_code'] != 200){
	    error_log("Hubo un error enviando el correo. Codigo de respuesta ".$info['http_code']);
	    return false;
	  }

	  curl_close($ch);

	  return true;
	}

}

?>