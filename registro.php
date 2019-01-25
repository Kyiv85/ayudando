    
    <?php include("includes/header.php"); ?>
    <?php include("includes/navbar.php"); ?>
    <script src='https://www.google.com/recaptcha/api.js'></script>

    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message" style="padding-top:5px;padding-bottom:5px;">
                        <h1>Registrate</h1>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.intro-header -->

    <div class="content-section-a">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 col-sm-12">
            <hr class="section-heading-spacer">
            <div class="clearfix"></div>
            <h2 class="section-heading">Déjanos tus datos</h2>
            <p class="lead">Indicanos si puedes prestarnos ayuda o te podemos ayudar</p>
          </div>
          <div class="col-lg-12 col-sm-12">
            <hr class="section-heading-spacer">
              <div class="clearfix"></div>
                         <!-- Start Content Section -->
                <section id="content">
                  <div class="container">
                    <div class="row">
                      <div class="col-md-9">
                        <h2>Introduce tus datos</h2>   

                          <!-- Start Contact Form -->
                          <form role="form" id="contactForm" class="contact-form" data-toggle="validator" class="shake">
                            <div class="form-group">
                              <div class="controls">
                                <input type="text" id="usuNombre" name="usuNombre" class="form-control" placeholder="Nombre" required data-error="Por favor introduce tu nombre">
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="controls">
                                <input type="text" id="usuApellido" name="usuApellido" class="form-control" placeholder="Apellido" required data-error="Por favor introduce tu apellido">
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="controls">
                                <input type="email" class="email form-control" id="usuEmail" name="usuEmail" placeholder="Email" required data-error="Por favor introduce tu email">
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="controls">
                                <label for="tipCod">Tipo de Documento:</label>
                                <select class="form-control" id="tipCod" name="tipCod" required data-error="Por favor elige una opción">
                                  <option value="1">DNI</option>
                                  <option value="2">Cédula</option>
                                  <option value="3">Pasaporte</option>
                                </select> 
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="controls">
                                <input type="number" class="form-control" id="usuDocumento" name="usuDocumento" placeholder="Número de documento" required data-error="Por favor introduce tu número de documento">
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="controls">
                                <label for="usuPais"><b style="color:#FF0000">País donde resides actualmente:</b></label>
                                <select required class="form-control" id="usuPais" name="usuPais" onChange="mostrarEvento(this.value)" data-error="Por favor elige una opción">
                                  <option value="Argentina">Argentina</option>
                                  <option value="Venezuela">Venezuela</option>
                                  <option value="Otro">Otro</option>
                                </select> 
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>
                            <!--<div class="form-group">
                              <div class="controls">
                                <label for="usuEventos">¿Deseas asistir al próximo seminario?</label>
                                <select required class="form-control" id="usuEventos" name="usuEventos" data-error="Por favor elige una opción">\n' +
                                  <option value="S" selected>Si</option>
                                  <option value="N">No</option>
                                </select>
                                <div id="usuEventosErr" class="help-block with-errors"></div>
                              </div>
                            </div>-->
                            <div class="form-group">
                              <div class="controls">
                                <textarea id="usuDireccion" name="usuDireccion" rows="3" placeholder="Escribe tu dirección actual" class="form-control" required data-error="Escribe tu dirección actual"></textarea>
                                <div class="help-block with-errors"></div>
                              </div>  
                            </div>
                            <div class="form-group">
                              <div class="controls">
                                <label for="usuTipo">Estoy buscando:</label>
                                <select class="form-control" id="usuTipo" name="usuTipo" required data-error="Por favor elige una opción">
                                  <option value="N">Ayuda</option>
                                  <option value="O">Prestar ayuda</option>
                                  <option value="A">Ambos</option>
                                </select> 
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="controls">
                                <input type="text" id="usuProfesion" name="usuProfesion" class="form-control" placeholder="Profesión" required data-error="Por favor introduce tu profesión">
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="controls">
                                <textarea id="usuComentarios" name="usuComentarios" rows="7" placeholder="Escribe tus comentarios u observaciones" class="form-control"></textarea>
                              </div>  
                            </div>
                            <div class="form-group">
                              <div class="g-recaptcha" data-sitekey="6LeJAlAUAAAAALx_byIqLL5da-ZsXTXi3UL3gtZb"></div>
                            </div>

                            <button type="submit" id="submit" class="btn btn-success"></i> Enviar</button>
                            <button type="clear" id="clear" class="btn btn-warning"></i> Limpiar</button>
                            <div id="msgSubmit" class="h3 text-center hidden"></div> 
                            <div class="clearfix"></div>   

                          </form>     
                          <!-- End Contact Form -->

            </div>
            <div class="col-md-3">
              <h2 class="big-title">Información de Contacto</h2>   
              <div class="information">              
                <div class="contact-datails">
                  <p>ayudanosayudarba@gmail.com</p>
                  <p>Buenos Aires, Argentina</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- End Content Section  -->
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-a -->

	
    
    <?php  
        include("includes/footer.php");
    ?>

