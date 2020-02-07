<?php
//Página para responder requests AJAX para el registro de usuarios
include("../../controllers/rifa/RifaController.php");
$rifa = new RifaController();
if (isset($_POST["accion"]) && ($_POST["accion"] == "validateNumbers")){
    //Verificar la respuesta
    $total = $rifa->validateNumbers();
    if(!$total) {
        echo $rifa->error;
    }
    else{
        $text = '';
        $selectedNumbers = [];
        $totalNumbers = [];
        foreach ($total as $t){
            array_push($selectedNumbers, $t['rifNumero']);
        }
        for($i=0;$i<1000;$i++){
            array_push($totalNumbers, $i);
        }
        foreach($totalNumbers as $t){
            $text .= '<div class="col-2">
                          <div class="input-group">
                              <div class="form-check">';
            $existe = false;
            foreach ($selectedNumbers as $s){
                if($t == $s){
                    $existe = true;
                }
            }
            if($existe){
                $text .= '<input class="form-check-input" type="checkbox" value="'.$t.'" id="rifNumero_'.$t.'" disabled>
                          <label class="form-check-label" for="defaultCheck2" style="color:red;">
                            '.str_pad(strval($t), 3, "0", STR_PAD_LEFT).'
                          </label>';
            }
            else{
                $text .= '<input class="form-check-input" type="checkbox" value="'.$t.'" id="rifNumero_'.$t.'">
                          <label class="form-check-label" for="defaultCheck1" style="margin-left: 25px;">
                            '.str_pad(strval($t), 3, "0", STR_PAD_LEFT).'
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
    if($rifa->procesarValores($_POST)){
        $data['error'] = 'NO';
        $data['mensaje'] = "Los números fueron cargados satisfactoriamente";
    }
    else{
        $data['error'] = 'SI';
        $data['mensaje'] = $rifa->error;
    }
    echo json_encode($data);
}
else {
    header('Location:/../../index.php');
}