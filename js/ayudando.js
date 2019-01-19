$(document).ready(function() {
  //Aceptar sólo números Ctrl+A,Ctrl+C,Ctrl+V,Ctrl+X Command+A y otras teclas funcionales
  $("#usuDocumento").keydown(function (e) {
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
  });    
});