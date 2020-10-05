<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">
    
    <!-- Title Page-->
    <title>Edición de números</title>
    
    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    
    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
    
    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
    
    <!-- Rifa JS-->
    <script src="js/rifa.js"></script>
    
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <!-- Bootstrap JS-->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>

<body onload="showNumbers()">
<div class="page-wrapper bg-blue font-robo">
    <div class="wrapper wrapper--w680">
        <div class="card card-1">
            <div class="card-heading"></div>
            <div id="mensajes"></div>
            <div class="card-body">
                <h2 class="title">Edición de número</h2>
                <form id="formUser" method="POST">
                    <div class="input-group">
                        <input class="input--style-1" type="text" placeholder="Nombre" id="rifNombre" name="rifNombre">
                    </div>
                    <div class="input-group">
                        <input class="input--style-1" type="text" placeholder="Apellido" id="rifApellido" name="rifApellido">
                    </div>
                    <div class="row row-space">
                        <div class="col-md-6">
                            <div class="input-group">
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <label>Tipo de documento</label>
                                    <select id="rifTipoDocumento" name="rifTipoDocumento">
                                        <option value="dni">DNI</option>
                                        <option value="precaria">Precaria</option>
                                        <option value="cedula">Cédula</option>
                                        <option value="pasaporte">Pasaporte</option>
                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-group">
                                <input class="input--style-1" type="number" onkeydown="onlyNumbers(this)" onkeyup="alert('Up')" placeholder="Número" id="rifNumDocumento" name="rifNumDocumento">
                            </div>
                        </div>
                    </div>
                    <div class="input-group">
                        <input class="input--style-1" type="number" onkeydown="onlyNumbers(this)" placeholder="Teléfono" id="rifTelefono" name="rifTelefono">
                    </div>
                    <div class="input-group">
                        <input class="input--style-1" type="email" placeholder="Correo" id="rifCorreo" name="rifCorreo">
                    </div>
                    <div class="row row-space">
                        <div class="col-md-6">
                            <div class="input-group">
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <label>Pagado</label>
                                    <select id="rifPago" name="rifPago">
                                        <option value="S">Si</option>
                                        <option value="N">No</option>
                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="input-group">
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <label>Ticket Electrónico</label>
                                    <select id="rifTicketElectronico" name="rifTicketElectronico">
                                        <option value="S">Si</option>
                                        <option value="N">No</option>
                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="input-group">
                        <div style="margin: inherit;">
                            <label>Números a escoger:</label>
                        </div>
                        <div id="rifNumbers" class="row row-space">
                        </div>
                    </div>
                    <div class="p-t-20">
                        <button type="button" onclick="process(this)" class="btn btn-primary">Enviar</button>
                        <button type="reset" class="btn btn-secondary">Limpiar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Jquery JS-->
<script src="vendor/jquery/jquery.min.js"></script>
<!-- Vendor JS-->
<script src="vendor/select2/select2.min.js"></script>
<script src="vendor/datepicker/moment.min.js"></script>
<script src="vendor/datepicker/daterangepicker.js"></script>

<!-- Main JS-->
<script src="js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->
