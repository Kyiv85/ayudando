<?php

require('fpdf/fpdf.php');

class printTickets {

    public function create($numbers,$nombre,$apellido,$tipoDoc,$numDoc){
        $pdf=new FPDF();
        $pdf->AddPage();
        $up=5;
        $j=1;
        foreach($numbers as $k => $n){
            $pdf->Image('ticket.jpeg',5,$up,180,120,'JPG');
            $pdf->SetFont('Arial','',15);
            $pdf->Ln(50);
            $pdf->SetTextColor(220,0,0);
            $pdf->Cell(130,105,str_pad(strval($n), 3, "0", STR_PAD_LEFT),0,0,'C');
            $pdf->SetX(10);
            $pdf->Cell(0,150,iconv('UTF-8', 'windows-1252', 'Este ticket fue generado automáticamente el día'),0,0);
            $pdf->Ln(8);  
            $pdf->Cell(0,150,iconv('UTF-8', 'windows-1252', date("d-m-Y, g:i a")),0,0);
            $pdf->Ln(8);  
            $pdf->Cell(0,150,iconv('UTF-8', 'windows-1252', 'A nombre de '.$nombre.' '.$apellido.', '.strtoupper($tipoDoc).' '.$numDoc),0,0);
            $j++;
            $pdf->Ln(18);
            $j++;
            $up=$up+120;
            if($j>=2){
                $j=1;
                $up=5;
                if($k != (count($number)-1)){
                    $pdf->AddPage();
                }
            }
        }
        $filename='tickets/ticket_'.strtoupper($nombre).'_'.strtoupper($apellido).'_'.$dni.'.pdf';
        $pdf->Output($filename,'F');
    }

}