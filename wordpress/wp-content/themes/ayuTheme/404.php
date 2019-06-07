<?php
/*
* Plantilla para todas las páginas
*/
 
// Exit if accessed directly
defined( 'ABSPATH' ) or die( 'No script kiddies please!' );?>
 
<?php get_header();?>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
          swal("", "La página que intentas visitar no existe!", "error");
        </script>
        <div class="intro-header">
          <div class="container">
            <div class="row">
              <div class="col-lg-12">
                <div class="intro-message" style="padding-top:5px;padding-bottom:5px;">
                  <h1>Error</h1>
                </div>
              </div>
            </div><!-- /.row -->
          </div><!-- /.container -->
        </div><!-- /.intro-headr -->
        <div class="content-section-a" style="height:100%;">
          <div class="page-wrap d-flex flex-row align-items-center">
            <div class="container">
              <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                  <span style="font-size:150px;">404</span>
                  <div class="mb-4 lead">Página no encontrada.</div>
                  <a href="<?php echo esc_url( home_url( '/' ) ); ?>" class="btn btn-link">Volver al inicio</a>
                </div>
              </div>
            </div>
          </div>
        </div>
 
<?php get_footer();?>