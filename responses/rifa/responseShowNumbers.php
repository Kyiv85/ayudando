<?php
//Página para responder requests AJAX para el registro de usuarios
include("../../controllers/rifa/RifaController.php");
$rifa = new RifaController();
if (isset($_POST["accion"]) && ($_POST["accion"] == "validateNumbers")){
    //Verificar la respuesta
    $total = $rifa->validateNumbers();
    if(!$total)
        echo $rifa->error;
    else{
        $text = '';
        for($i=0;$i<1000;$i++){
            $text .= '<div class="col-2">
                          <div class="input-group">
                              <div class="form-check">';
            $existe = false;
            foreach ($rifa as $r){
                if($i == $r['rifNumero']){
                    $existe = true;
                }
            }
            if($existe){
                $text .= '<input class="form-check-input" type="checkbox" value="'.$i.'" id="rifNumero_'.$i.'" disabled>
                          <label class="form-check-label" for="defaultCheck2" style="color:red;">
                            '.str_pad(strval($i), 3, "0", STR_PAD_LEFT).'
                          </label>';
            }
            else{
                $text .= '<input class="form-check-input" type="checkbox" value="'.$i.'" id="rifNumero_'.$i.'">
                          <label class="form-check-label" for="defaultCheck1" style="margin-left: 25px;">
                            '.str_pad(strval($i), 3, "0", STR_PAD_LEFT).'
                          </label>';
            }
            $text .= '
                            </div>
                        </div>
                    </div>';
        }
        echo $text;
    }
    exit();
}
else if (isset($_POST["accion"]) && ($_POST["accion"] == "procesarNumeros")){
    //Verificar la respuesta
    $total = $rifa->procesarValores($_POST);
    if(!$total)
        echo $rifa->error;
    else{
        $text = '';
        for($i=0;$i<1000;$i++){
            $text .= '<div class="col-2">
                          <div class="input-group">
                              <div class="form-check">';
            $existe = false;
            foreach ($rifa as $r){
                if($i == $r['rifNumero']){
                    $existe = true;
                }
            }
            if($existe){
                $text .= '<input class="form-check-input" type="checkbox" value="" id="rifNumero" disabled>
                          <label class="form-check-label" for="defaultCheck2" style="color:red;">
                            '.str_pad(strval($i), 3, "0", STR_PAD_LEFT).'
                          </label>';
            }
            else{
                $text .= '<input class="form-check-input" type="checkbox" value="" id="rifNumero">
                          <label class="form-check-label" for="defaultCheck1" style="margin-left: 25px;">
                            '.str_pad(strval($i), 3, "0", STR_PAD_LEFT).'
                          </label>';
            }
            $text .= '
                            </div>
                        </div>
                    </div>';
        }
        echo $text;
    }
    exit();
}
else {
    header('Location:/../../index.php');
}