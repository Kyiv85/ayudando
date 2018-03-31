<?php
//Página para responder requests AJAX para el registro de usuarios
include("../controllers/registro/RegistroController.php");

$reg = new RegistroController();


//Registrar el usuario
if (isset($_POST["accion"]) && ($_POST["accion"] == "verPagosRelacionados")){
  $comp = new Gastos();
  $resp["gastos"] = $comp->getGastosCompraRelacion($_POST['comID']);
  $resp["notasCredito"] = $comp->getNotasCreditoRelacionadas($_POST["comID"]);
  
  //Verificar si existen certificados de retención para la compra
  $cert = CertificadosRetencion::getCertByCompra($_POST["comID"]);
  if (count($cert)>0){
    $resp["certificado"] = $cert;
  }
  echo json_encode($resp);
  exit();
}
else {
  header('Location:index.php');
}