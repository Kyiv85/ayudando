<?php
/**
* Plantilla para los post
**/
 
// Exit if accessed directly
defined( 'ABSPATH' ) or die( 'No script kiddies please!' );?>
 
<?php get_header();?>
 
  <div class="intro-header">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="intro-message" style="padding-top:5px;padding-bottom:5px;">
            <h1>Blog</h1>
            <h2><?php the_title();?></h2>
          </div>
        </div>
      </div>
    </div><!-- /.container -->
  </div>
  <?php get_sidebar();

  if (have_posts()) :

    while (have_posts()) : the_post();?>
      <div class="content-section-a">
        <article id="post-<?php the_ID();?>" <?php post_class();?>>
          <div class="container">
            <div class="row">
              <div class="col-lg-12 col-sm-12">
                <hr class="section-heading-spacer">
                <div class="clearfix"></div>
                <div class="post-header">
                  <div class="date"><?php the_time( 'j-M-Y' ); ?></div>
                  <h2><a href="<?php the_permalink(); ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
                  <div class="author"><?php the_author(); ?></div>
                </div><!--.post-header-->
                <div class="entry clear">
                  <?php if ( function_exists( 'add_theme_support' ) ) the_post_thumbnail(); ?>
                  <?php the_content(); ?>
                  <?php edit_post_link(); ?>
                  <?php wp_link_pages(); ?>
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
                <nav class="navigation index">
                  <div class="alignleft"><?php next_posts_link( 'Older Entries' ); ?></div>
                  <div class="alignright"><?php previous_posts_link( 'Newer Entries' ); ?></div>
                </nav><!--.navigation-->
              </div>
            </div><!-- row -->
          </div><!-- container -->
        </article>
      </div><!-- content-section-a -->

    <?php endwhile;

    endif;?>
 
<?php get_footer();?>