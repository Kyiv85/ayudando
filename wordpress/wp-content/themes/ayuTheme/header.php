<!DOCTYPE html>
<html <?php language_attributes(); ?> class="no-js">
<head>
  <meta charset="utf-8">
  <meta charset="<?php bloginfo('charset'); ?>">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
  
  <!--  Essential META Tags -->
  <meta name="description" content="Proyecto solidario y sin fines de lucro de venezolanos en Argentina para brindar apoyo a los coterráneos en condición de riesgo que vienen huyendo de la crisis humanitaria en Venezuela">
  <meta property="og:title" content="Ayúdanos a Ayudar">
  <meta property="og:url" content="http://www.ayudanosayudarba.com/">
  <meta property="og:description" content="Para apoyar a los venezolanos en Argentina">
  <meta property="og:image" content="http://www.ayudanosayudarba.com/AaA.png">
  <meta property="og:type" content="article">
  <meta name="google" content="nositelinkssearchbox">
  <meta name="robots" content="index,follow">

  <link rel="profile" href="http://gmpg.org/xfn/11">
  <link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
  <!--[if lt IE 9]>
  <script src="<?php echo esc_url( get_template_directory_uri() ); ?>/js/html5.js"></script>
  <![endif]-->
  <?php wp_head(); ?>

  <title><?php wp_title( '|', true, 'right' ); ?>Ayúdanos a Ayudar BA</title>

  <!-- Fav Icon -->
  <link rel="icon" href="favicon.ico">

  <link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" />

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-142540115-1"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-142540115-1');
  </script>
  <!-- Google AdSense -->
  <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
  <script>
    (adsbygoogle = window.adsbygoogle || []).push({
      google_ad_client: "ca-pub-2410524950153558",
      enable_page_level_ads: true
    });
  </script>

</head>

<body <?php body_class(); ?>>
  <!-- Navigation -->
  <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
    <div class="container topnav">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand topnav" href="<?php echo esc_url( home_url( '/' ) ); ?>">Ayudanos a Ayudar</a><span class="flag-icon flag-icon-gr"></span>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
          <li>
            <a href="<?php echo get_page_link( get_page_by_title( 'Blog' )->ID ); ?>">Blog</a>
          </li>
          <li>
            <a href="registro.php">Registro</a>
          </li>
          <li>
            <a href="<?php echo get_page_link( get_page_by_title( 'Contacto' )->ID ); ?>">Contacto</a>
          </li>
        </ul>
      </div>
      <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
  </nav>