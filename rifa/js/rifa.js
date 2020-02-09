//Aceptar sólo números Ctrl+A,Ctrl+C,Ctrl+V,Ctrl+X Command+A y otras teclas funcionales
function onlyNumbers(e){
    // Allow: backspace, delete, tab, escape, enter
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
        // Allow: Ctrl+A,Ctrl+C,Ctrl+V,Ctrl+X Command+A
        ((e.keyCode == 65 || e.keyCode == 86 || e.keyCode == 67 || e.keyCode == 88) && (e.ctrlKey === true || e.metaKey === true)) ||
        // Allow: home, end, left, right, down, up
        (e.keyCode >= 35 && e.keyCode <= 40)) {
        // let it happen, don't do anything
        return;
    }
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
}

function showNumbers(){
    var xmlhttp = new XMLHttpRequest();
    var url = "../responses/rifa/responseShowNumbers.php";
    xmlhttp.open("POST", url, true);
    xmlhttp.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xmlhttp.send('accion=validateNumbers');
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.status == 200) {
            var divNumbers = document.getElementById('rifNumbers');
            divNumbers.innerHTML = xmlhttp.responseText;
        }
        else{
            var mensajes = document.getElementById('mensajes');
            mensajes.innerHTML = '<div class="alert alert-danger" role="alert">\n' +
                '                        Hubo un error cargando la información\n' +
                '                    </div>'
            return false;
        }
    }
}

function printTickets(params){
    var win = window.open('pdf-create/create-ticket.php?'+params, '_blank');
}

function process(e){
    var rifNombre = document.getElementById("rifNombre").value;
    var rifApellido = document.getElementById("rifApellido").value;
    var rifTipoDocumento = document.getElementById("rifTipoDocumento").value;
    var rifNumDocumento = document.getElementById("rifNumDocumento").value;
    var rifTelefono = document.getElementById("rifTelefono").value;
    var rifCorreo = document.getElementById("rifCorreo").value;
    var rifPago = document.getElementById("rifPago").value;
    var rifTicketElectronico = document.getElementById("rifTicketElectronico").value;
    var rifNumbers = [];
    var checkboxes = document.querySelectorAll('input[type=checkbox]:checked');
    for (var i = 0; i < checkboxes.length; i++) {
        rifNumbers.push(checkboxes[i].value)
    }
    if(rifNombre == ""){
        alert("Coloca el nombre");
    }
    else if(rifApellido == ""){
        alert("Coloca el apellido");
    }
    else if(rifTipoDocumento == ""){
        alert("Elige el tipo de documento");
    }
    else if(rifNumDocumento == ""){
        alert("Coloca el número de documento");
    }
    else if(rifTelefono == ""){
        alert("Coloca el teléfono");
    }
    else if(rifCorreo == ""){
        alert("Coloca el correo");
    }
    else if(checkboxes.length < 1){
        alert("Elige al menos un número");
    }
    else{
        var xmlhttp = new XMLHttpRequest();
        var url = "../responses/rifa/responseShowNumbers.php";
        var msg=true;
        var params = 'accion=procesarNumeros&rifNombre='+rifNombre+'&rifApellido='+rifApellido+'&rifTipoDocumento='+rifTipoDocumento+'&rifNumDocumento='+rifNumDocumento+'&rifTelefono='+rifTelefono+'&rifCorreo='+rifCorreo+'&rifNumbers='+rifNumbers+'&rifPago='+rifPago+'&rifTicketElectronico='+rifTicketElectronico;
        xmlhttp.open("POST", url, true);
        xmlhttp.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xmlhttp.overrideMimeType("application/json");
        xmlhttp.send(params);
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.status == 200) {
                if((xmlhttp.responseText).length>0 && msg){
                    var data = JSON.parse(xmlhttp.responseText);
                    alert(data.mensaje);
                    if(data.error == 'NO'){
                        showNumbers();
                        if(rifTicketElectronico == 'S'){
                            printTickets(params);
                        }
                        document.getElementById("formUser").reset();
                    }
                    msg=false;
                }
            }
            else{
                alert("Error enviando la información");
                return false;
            }
        }
    }
    e.preventDefault;
    return false;
}