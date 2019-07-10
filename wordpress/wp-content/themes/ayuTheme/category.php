<?php
/*
* Plantilla para todas categoría
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
        <div class="container">
          <div class="row">
            <div class="col-lg-12 col-sm-12">
              <hr class="section-heading-spacer">
              <div class="clearfix"></div>
              <div class="post-header">
                <h2><a href="<?php the_permalink() ?>" rel="bookmark" title="<?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
                <small><?php the_time('F jS, Y') ?> by <?php the_author_posts_link() ?></small>
              </div><!--.post-header-->
              <div class="entry-clear">
                <?php the_excerpt(); ?>
                <br><br>
                <a href="<?php echo get_page_link( get_page_by_title( 'Blog' )->ID ); ?>">Volver a Blog</a>
              </div><!--. entry-->
              <div class="post-footer">
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
    </div><!-- entry-content -->

  <?php endwhile;

endif;?>

<?php get_footer();?>