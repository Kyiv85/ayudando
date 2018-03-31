$("#contactForm").validator().on("submit", function (event) {
  //Deshabilitar botón de submit
  $('#submit').prop('disabled', true);
  if (event.isDefaultPrevented()) {
    //handle the invalid form...
      formError();
      submitMSG(false, "Faltan algunos campos por llenar en el formulario");
      $('#submit').prop('disabled', false);
  } else {
    //everything looks good!
      event.preventDefault();
      submitForm();
  }
});

//Proceso de registro del formulario
function submitForm(){
  //Caputrar valores del formulario
  var usuNombre = $('#usuNombre').val();
  var usuApellido = $('#usuApellido').val();
  var usuEmail = $('#usuEmail').val();
  var tipCod = $('#tipCod').val();
  var usuApellido = $('#usuApellido').val();
  var usuDocumento = $('#usuDocumento').val();
  var usuPais = $('#usuPais').val();
  var usuDireccion $('#usuDireccion').val();
  var usuTipo = $('#usuTipo').val();
  var usuProfesion = $('#usuProfesion').val();
  var usuComentarios = $('#usuComentarios').val();

  //Procesar info
  $.ajax({
      url: 'response.php',
      type: "POST",
      data: {
        accion: "buscarAsociarGasto",
        comID: comID,
        idGasto: idGasto,
        notaCredito: notaCredito,
        ccoID: ccoID,
        gasMonto: gasMonto,
        gasFechaDesde: gasFechaDesde,
        gasFechaHasta: gasFechaHasta
      },
      success: function (data) {
        //Parsear JSON
        var obj = jQuery.parseJSON(data);

        //Si hay mensaje de error mostrarlo
        if (typeof obj["mensaje"] != "undefined" || obj["mensaje"] != null) {
          $('#mensajesAsociar').html("<div class='alert alert-danger'>"+obj['mensaje']+"</div>");
          window.setTimeout(function() {
            $("#mensajesAsociar div").fadeTo(500, 0).slideUp(500, function(){
              $(this).remove();
            });
          }, 60000);
        }
        else {

          //Ajustar overflow de la ventana del modal
          $('div.modal-dialog').css('overflow-y','initial !important');
          $('div.modal-body').css('height', '400px')
            .css('overflow-y', 'auto');

          //Ocultar botón de buscar gastos y mostrar el de volver
          $('#btnBuscarAsociarGasto').css('display','none');
          $('#btnBackAsociarGasto').css('display','');

          //Mostrar section con la tabla
          $('#secBuscarGastos').fadeOut('slow');
          $('#secTableGastos').fadeIn(2000);

          //Agregar resultados al array de objetos
          datos = obj;

          //Eliminar los mensajes de error si existen
          $("#mensajesAsociar div").remove();

          //Eliminar información de la tabla
          $('#tableGastos tbody tr').remove();

          if(datos.length == 0) {
            //Si no hay elementos se muestra mensaje indicando que no se consiguieron datos
            $('#tableGastos tbody').html("<tr><td class='text-center' colspan=5>No se consiguieron gastos que coincidan con los criterios de búsqueda</td></tr>");
          }
          else{
            //Mostrar los datos de la compra
            $('#datosCompra').html("<h4>Datos de la compra actual:</h4>" +
              "              - <b>Proveedor:</b> "+proRazonSocial+"<br>\n" +
              "              - <b>Fecha:</b> "+comFecha+"<br>\n" +
              "              - <b>Importe:</b> "+parseFloat(comImporte).toFixed(2)+"<br>");

            //Se actualiza la tabla con los elementos en el objeto
            for (var i=0;i<datos.length;i++) {
              //Formtear fecha
              var fecha = new Date(datos[i]["gasFecha"]);
              fecha.setDate(fecha.getDate());

              //Poner ceros al día y mes de ser necesario
              if(fecha.getDate()<10){
                dia = "0"+fecha.getDate();
              }
              else {
                dia = fecha.getDate();
              }
              if((fecha.getMonth()+1)<10){
                mes = "0"+(fecha.getMonth()+1);
              }
              else {
                mes = fecha.getMonth()+1;
              }

              //Variable de control NC - No mostrar botón de asociar retención para las notas de crédito
              if (datos[i]["notaCredito"] == "NO"){
                isNC = 'NO';
                retencion = "           <a href='#' onClick='cargarAsociarRetencion("+comID+","+datos[i]["idGasto"]+")' class='table-link warning' title='Relacionar con retención'>\n";
              }
              else {
                isNC = 'SI';
                retencion = "           <a href='#' class='table-link' style='pointer-events:none;color:gray'>\n";
              }

              $('#tableGastos tbody').append("<tr>\n" +
                "                    <td class='text-center'>"+datos[i]["idGasto"]+"</td>\n" +
                "                    <td class='text-center'>"+datos[i]["banDescrip"]+"</td>\n" +
                "                    <td class='text-center'>"+parseFloat(datos[i]["gasMonto"]).toFixed(2)+"</td>\n" +
                "                    <td class='text-center'>"+dia+"-"+mes+"-"+fecha.getFullYear()+"</td>\n" +
                // Acciones de gastos
                "                    <td style='width:100px;'>\n" +
                "                     <a href='#' onClick='asociarCompraGasto("+comID+","+datos[i]["idGasto"]+",\""+isNC+"\")' class='table-link success' title='Relacionar compra con gasto'>\n" +
                "                       <span class='fa-stack'>\n" +
                "                         <i class='fa fa-square fa-stack-2x'></i>\n" +
                "                         <i class='fa fa-check-circle fa-stack-1x fa-inverse'></i>\n" +
                "                       </span>\n" +
                "                     </a>\n" +
                retencion +
                "                       <span class='fa-stack'>\n" +
                "                         <i class='fa fa-square fa-stack-2x'></i>\n" +
                "                         <i class='fa fa-check-circle fa-stack-1x fa-inverse'></i>\n" +
                "                       </span>\n" +
                "                     </a>\n" +
                "                    </td>\n" +
                "                   </tr>");
            }
          }
        }
      },
      error: function(){
        $('#mensajesAsociar').html("<div class='alert alert-danger'>\n" +
          "  Hubo un error al intentar realizar la búsqueda.\n" +
          "</div>");
        window.setTimeout(function() {
          $("#mensajesAsociar div").fadeTo(500, 0).slideUp(500, function(){
            $(this).remove();
          });
        }, 60000);
      }
    });
  }

  /*$.ajax({
      type: "POST",
      url: "assets/php/form-process.php",
      data: "name=" + name + "&email=" + email + "&msg_subject=" + msg_subject + "&message=" + message,
      success : function(text){
          if (text == "success"){
              formSuccess();
          } else {
              formError();
              submitMSG(false,text);
          }
      }
  });*/

  $('#submit').prop('disabled', false);
}

function formSuccess(){
  $("#contactForm")[0].reset();
  submitMSG(true, "Registro completado exitosamente!")
}

function formError(){
  $("#contactForm").removeClass().addClass('shake animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
    $(this).removeClass();
  });
}

function submitMSG(valid, msg){
  if(valid){
    var msgClasses = "h3 text-center tada animated text-success";
  } else {
    var msgClasses = "h3 text-center text-danger";
  }
  $("#msgSubmit").removeClass().addClass(msgClasses).text(msg);
}