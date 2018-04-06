<?php
//Clase para el envio de emails

include("../../libs/PHPMailer/PHPMailerAutoload.php");

class EmailMG {


	/* 
	* Envía el correo de confirmación al usuario PRODUCCIÓN CON cURL
	* @param array $data Datos del usuario
	* @return bool
	*/
	public static function sendEmailcURL($data) {

	  $ch = curl_init();

	  curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
	  curl_setopt($ch, CURLOPT_USERPWD, 'api:key-d815441fa52496e209e486834697fe5c');
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
 		curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_ENCODING, 'UTF-8');
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	  curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
	  curl_setopt($ch, CURLOPT_URL, 'https://api.mailgun.net/v3/mg.ayudanosayudarba.com');
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



	/* 
	* Envía el correo de confirmación al usuario vía SMTP
	* @param array $data Datos del usuario
	* @return bool
	*/
	public static function sendEmail($data) {

		//Archivo con los parámetros de configuración del correo
		include("../../models/config/config.php.ini");

		//Usar valores
		$mail = new PHPMailer();
  	$mail->setFrom($mail_mg,$nombre_mg);
  	$mail->isSMTP();
  	$mail->Host = 'smtp.mailgun.org';
  	$mail->Port = 465;
  	$mail->SMTPAuth = true;
  	$mail->Username = $username_mg; // SMTP username from https://mailgun.com/cp/domains
  	$mail->Password = $password_mg; // SMTP password from https://mailgun.com/cp/domains
  	$mail->SMTPSecure = 'ssl';
  
  	$mail->addAddress($data["usuEmail"]);     // Recipient's email address and optionally a name to identify him
    $mail->isHTML(true);   // Set email to be sent as HTML, if you are planning on sending plain text email just set it to false
  	$mail->addAddress($data["usuEmail"]);     // Recipient's email address and optionally a name to identify him
    $mail->isHTML(true);   // Set email to be sent as HTML, if you are planning on sending plain text email just set it to false

    // The following is self explanatory
    $mail->Subject = 'Registro generado satisfactoriamente!';
    $mail->Body    = '<b>Hola '.$data["usuNombre"].' '.$data["usuApellido"].'!</b>, <br><br><br>Gracias por registrarte en nuestro portal. Esperemos que puedas apoyarnos en brindar ayuda o que podamos ayudarte si lo necesitas. Nos estaremos contactando contigo por esta vía en caso de ser necesario. <br><br>Saludos!.<br>El Equipo de Ayúdanos a Ayudar.';
  
  	if (!$mail->send()) {
    	error_log('Hubo un error enviando el correo: '.$mail->ErrorInfo);
      return false; 
  	}
  
		return true;

	}

}

?>