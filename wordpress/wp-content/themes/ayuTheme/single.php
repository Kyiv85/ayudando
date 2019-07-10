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
                  <div class="date"><?php the_time( 'j-M-Y H:m:i' ); ?></div>
                  <h1><a href="<?php the_permalink(); ?>" rel="bookmark" title="<?php the_title_attribute(); ?>"><?php the_title(); ?></a></h1>
                  <div class="author">
                    <h4>Publicado por:</h4>
                    <h5>
                      <?php echo get_avatar( get_the_author_meta( 'ID' ), 32 ); ?>
                      <span style="margin-left:25px;"><?php the_author(); ?></span>
                    </h5>
                  </div>
                </div><!--.post-header-->
                <div class="entry-clear">
                  <?php if ( function_exists( 'add_theme_support' ) ) the_post_thumbnail(); ?>
                  <?php the_content(); ?>
                  <?php if(current_user_can('administrator')): ?>
                    <?php edit_post_link(); ?>
                  <?php endif; ?>
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
      </div><!-- content-section-a -->

    <?php endwhile;

    endif;?>
 
<?php get_footer();?>