<?php
//Página para responder requests AJAX para el registro de usuarios
include("../../controllers/registro/RegistroController.php");

//Registrar el usuario
if (isset($_POST["accion"]) && ($_POST["accion"] == "registrarUsuario")){
  $reg = new RegistroController();
  $datos = $_POST;
  //Valirdar el reCaptcha
  if(($datos["reCaptcha"] == null) || ($datos["reCaptcha"] == "")){
    echo "Valida el reCaptcha";
  }
  else{
    $resp = $reg->registrarUsuario($datos);

    //Verificar la respuesta
    if($resp){
      echo "El registro se completó satisfactoriamente!";
    }
    else{
      echo $reg->error;
    }
  }
  exit();
}
else {
  header('Location:index.php');
}