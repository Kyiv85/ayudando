    
    <?php include("includes/header.php"); ?>
    <?php include("includes/navbar.php"); ?>

    <style>
      #map {
        width: 100%;
        height: 400px;
        background-color: grey;
      }
    </style>

    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
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
            <h2 class="section-heading">Ponencia sobre búsqueda laboral</h2>
            <p class="lead">Para el domingo 8 de abirl estaremos realizando un seminario sobre herramientas de bśuqueda laboral, de manera que sirva de apoyo a los compatriotas que aún no consigan trabajo y pueden aprender a manejarse de una manera más eficiente en Argentina a la hora de conseguir empleo. La misma estára siendo de 8am a 1pm.</p>
            <p class="lead">Vamos a estar llevando un registro y seleccionaremos un grupo de 30 personas entre distintos perfiles que puedan estar asistiendo a la ponencia. Si estás interesado en asitir llena el siguiente formulario y nos pondremos en contacto contigo.</p>
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
                                <input type="text" id="name" class="form-control" placeholder="Nombre" required data-error="Por favor introduce tu nombre">
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="controls">
                                <input type="text" id="lastname" class="form-control" placeholder="Apellido" required data-error="Por favor introduce tu apellido">
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="controls">
                                <input type="email" class="email form-control" id="email" placeholder="Email" required data-error="Por favor introduce tu email">
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="controls">
                                <label for="sel1">Estoy buscando:</label>
                                <select class="form-control" id="sel1"  required data-error="Observaciones">
                                  <option>Ayuda</option>
                                  <option>Prestar ayuda</option>
                                </select> 
                                <div class="help-block with-errors"></div>
                              </div>
                            </div>
                            <div class="form-group">
                              <div class="controls">
                                <textarea id="message" rows="7" placeholder="Massage" class="form-control" required data-error="Escribe tus observaciones"></textarea>
                                <div class="help-block with-errors"></div>
                              </div>  
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
                  <p> Gascón 62, Almagro, Buenos Aires, Argentina.</p>
                  <p> +54 9 11 3255-6087 </p>
                  <p> dedd712@gmail.com </p>
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

