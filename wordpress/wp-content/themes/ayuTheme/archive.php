<?php
/*
* Plantilla para todas las páginas
*/

// Exit if accessed directly
defined( 'ABSPATH' ) or die( 'No script kiddies please!' );?>

<?php get_header();?>

<?php

if (have_posts()) :

  while (have_posts()) : the_post();?>

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
    <div class="content-section-a">
      <article id="post-<?php the_ID();?>" <?php post_class();?>>
        <?php the_content();?>
      </article>
    </div><!-- entry-content -->

  <?php endwhile;

endif;?>

<?php get_footer();?>