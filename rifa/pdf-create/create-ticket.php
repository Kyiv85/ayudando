<?php

require('printTicket.php');
$print = new printTickets();
$data = $_GET;
$rifNumbers = explode(',',$data['rifNumbers']);
$print->create($rifNumbers,$data['rifNombre'],$data['rifApellido'],$data['rifTipoDocumento'],$data['rifNumDocumento']);    