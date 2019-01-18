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
  var usuDocumento = $('#usuDocumento').val();
  var usuPais = $('#usuPais').val();
  try {
    var usuEventos = document.getElementById("usuEventos").value;
  }
  catch(err) {
    var usuEventos = null;
  }
  var usuDireccion = $('#usuDireccion').val();
  var usuTipo = $('#usuTipo').val();
  var usuProfesion = $('#usuProfesion').val();
  var usuComentarios = $('#usuComentarios').val();

  //Validar el reCaptcha
  var response = grecaptcha.getResponse();
  if(response.length == 0){
    //reCaptcha not verified
    formError();
    submitMSG(false,'Valida el reCaptcha');
  }
  else{
    //Procesar info
    $.ajax({
      url: 'responses/registro/responseRegistro.php',
      type: "POST",
      data: {
        accion: "registrarUsuario",
        usuNombre: usuNombre,
        usuApellido: usuApellido,
        usuEmail: usuEmail,
        tipCod: tipCod,
        usuDocumento: usuDocumento,
        usuPais: usuPais,
        usuEventos: usuEventos,
        usuDireccion: usuDireccion,
        usuTipo: usuTipo,
        usuProfesion: usuProfesion,
        usuComentarios: usuComentarios,
        reCaptcha: response
      },
      success: function (data) {
        if (data == "success"){
          formSuccess();
        } else {
          formError();
          submitMSG(false,data);
        }
      },
      error: function(){
        formError();
        submitMSG(false,'Hubo un error al enviar el formulario, por favor contacta con el administrador');
      }
    });
  }
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