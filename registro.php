<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Todos Unidos - Ayudando a ayudar</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/landing-page.css" rel="stylesheet">

    <!-- Animate CSS  -->
    <link href="css/animate.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <?php include("navbar.php"); ?>


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
              <h2>Contact Form</h2>   

            <!-- Start Contact Form -->
            <form role="form" id="contactForm" class="contact-form" data-toggle="validator" class="shake">
              <div class="form-group">
                <div class="controls">
                  <input type="text" id="name" class="form-control" placeholder="Name" required data-error="Please enter your name">
                  <div class="help-block with-errors"></div>
                </div>
              </div>
              <div class="form-group">
                <div class="controls">
                  <input type="email" class="email form-control" id="email" placeholder="Email" required data-error="Please enter your email">
                  <div class="help-block with-errors"></div>
                </div>
              </div>
              <div class="form-group">
                <div class="controls">
                  <input type="text" id="msg_subject" class="form-control" placeholder="Subject" required data-error="Please enter your message subject">
                  <div class="help-block with-errors"></div>
                </div>
              </div>
              <div class="form-group">
                <div class="controls">
                  <textarea id="message" rows="7" placeholder="Massage" class="form-control" required data-error="Write your message"></textarea>
                  <div class="help-block with-errors"></div>
                </div>  
              </div>

              <button type="submit" id="submit" class="btn btn-success"></i> Send Message</button>
              <div id="msgSubmit" class="h3 text-center hidden"></div> 
              <div class="clearfix"></div>   

            </form>     
            <!-- End Contact Form -->

            </div>
            <div class="col-md-3">
              <h2 class="big-title">Contact Info</h2>   
              <div class="information">              
                <div class="contact-datails">
                  <p> 12 Tottenham Road, London, England.</p>
                  <p> +880 123 456 789 </p>
                  <p> hello@graygrids.com </p>
                  <p> Sun-Sat (9am-5pm)</p>
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
        include("footer.php");
    ?>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Main JS  -->      
    <script src="js/form-validator.min.js"></script>  
    <script src="js/contact-form-script.js"></script>

</body>

</html>
