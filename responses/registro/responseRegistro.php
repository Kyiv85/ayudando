<?php
//Página para responder requests AJAX para el registro de usuarios
include("../../controllers/registro/RegistroController.php");

//Registrar el usuario
if (isset($_POST["accion"]) && ($_POST["accion"] == "registrarUsuario")){
  $reg = new RegistroController();
  $datos = $_POST;
  $resp = $reg->registrarUsuario($datos);

  //Verificar la respuesta
  if($resp){
    echo "mamalo es tru";
  }
  else{
    echo $reg->error;
  }
  /*$comp = new Gastos();
  $resp["gastos"] = $comp->getGastosCompraRelacion($_POST['comID']);
  $resp["notasCredito"] = $comp->getNotasCreditoRelacionadas($_POST["comID"]);
  
  //Verificar si existen certificados de retención para la compra
  $cert = CertificadosRetencion::getCertByCompra($_POST["comID"]);
  if (count($cert)>0){
    $resp["certificado"] = $cert;
  }
  echo json_encode($resp);
  exit();*/
  exit();
}
else {
  header('Location:index.php');
}