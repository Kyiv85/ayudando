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
              <div class="post-header">
                <h2><a href="<?php the_permalink(); ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
                <div class="author"><?php the_author(); ?></div>
              </div><!--.post-header-->
              <div class="entry clear">
                <?php if ( function_exists( 'add_theme_support' ) ) the_post_thumbnail(); ?>
                <?php
                  $how_many_last_posts = intval(get_post_meta($post->ID, 'archived-posts-no', true));

                  /* Here, we're making sure that the number fetched is reasonable. In case it's higher than 200 or lower than 2, we're just resetting it to the default value of 15. */
                  if($how_many_last_posts > 200 || $how_many_last_posts < 2) $how_many_last_posts = 15;

                  $my_query = new WP_Query('post_type=post&nopaging=1');
                  if($my_query->have_posts()) {
                    echo '<h1 class="widget-title">Last '.$how_many_last_posts.' Posts <i class="fa fa-bullhorn" style="vertical-align: baseline;"></i></h1>&nbsp;';
                    echo '<div class="archives-latest-section"><ol>';
                    $counter = 1;
                    while($my_query->have_posts() && $counter <= $how_many_last_posts) {
                      $my_query->the_post();
                      ?>
                      <li><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></li>
                      <?php
                      $counter++;
                    }
                    echo '</ol></div>';
                    wp_reset_postdata();
                  }
                ?>
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