<?php

require('fpdf/fpdf.php');

$pdf=new FPDF();
$pdf->AddPage();
$up=5;
$i=0;
$j=1;
while ($i<1000){
    $pdf->Image('ticket.jpeg',5,$up,100,65,'JPG');
    $pdf->Image('ticket.jpeg',105,$up,100,65,'JPG');
    $pdf->SetFont('Arial','',15);
    $pdf->Ln(50);
    $pdf->Cell(75,5,str_pad(strval($i), 3, "0", STR_PAD_LEFT),0,0,'C');
    $i++;
    $j++;
    $pdf->Cell(125,5,str_pad(strval($i), 3, "0", STR_PAD_LEFT),0,0,'C');
    $pdf->Ln(18);
    $i++;
    $j++;
    $up=$up+68;
    if($j>=8){
        $j=1;
        $up=5;
        if($i!=1000)
        $pdf->AddPage();
    }
}
$pdf->Output();