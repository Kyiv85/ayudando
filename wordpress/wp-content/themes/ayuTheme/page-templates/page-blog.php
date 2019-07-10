<?php
/* Template Name: CustomPageBlog */

// Exit if accessed directly
defined( 'ABSPATH' ) or die( 'No script kiddies please!' );

get_header();

?>

  <div class="intro-header">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="intro-message" style="padding-top:5px;padding-bottom:5px;">
            <h1><?php the_title();?></h1>
          </div>
        </div>
      </div>
    </div><!-- /.container -->
  </div>

<?php
if (have_posts()) :

  while (have_posts()) : the_post();?>

    <div class="content-section-a">
      <article id="post-<?php the_ID();?>" <?php post_class();?>>
        <div class="container">
          <div class="row">
            <div class="col-lg-12 col-sm-12">
              <hr class="section-heading-spacer">
              <div class="clearfix"></div>
              <div class="entry clear">
                <h1 class="widget-title">Blog y noticias</h1>
                <h4>En esta sección estaremos compartiendo noticias e información de interés y todo lo relacionado
                  a los eventos que vayamos realizando:</h4><br>
                <?php
                  $paged = ( get_query_var( 'paged' ) ) ? get_query_var( 'paged' ) : '1';
                  $args = array (
                    'nopaging'               => false,
                    'paged'                  => $paged,
                    'posts_per_page'         => '5',
                    'post_type'              => 'post',
                  );
                  $my_query = new WP_Query( $args );
                  if($my_query->have_posts()) {
                    echo '<div class="archives-latest-section"><ol>';
                    echo '<div style="margin-bottom:40px;">';
                    previous_posts_link( '« Entradas más nuevas' );
                    echo '</div>';
                    while($my_query->have_posts()) {
                      $my_query->the_post();
                      ?>
                      <div style="margin-bottom:40px;"><li><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title_attribute(); ?>"><?php the_title(); ?></a></li>
                      <?php the_excerpt(__('(Más…)')); ?>
                      </div>
                      <?php
                    }
                    next_posts_link( 'Entradas más antiguas »', $my_query->max_num_pages );
                    echo '</ol></div>';
                    wp_reset_postdata();
                  }
                ?>
              </div><!--. entry-->
              <div class="post-footer" style="margin-top:80px;">
                <div class="comments">
                <?php
                  if (comments_open()){
                    comments_template();
                  }
                ?>
                </div>
              </div><!--.post-footer-->
            </div>
          </div><!-- row -->
        </div><!-- container -->
      </article>
    </div><!-- content-section-a -->

  <?php endwhile;

endif;?>

<?php get_footer();?>