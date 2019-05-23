<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'phpmyadmin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'Paola1611' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'Y>Eg.c<Cv?2gDQ?jHfTI/]+~.uc$(VNQsH/v^OLs[sPsPI;i{@ /M{Fv?W-eL/RG' );
define( 'SECURE_AUTH_KEY',  'o<lS*>5I&~d5G=dEAvQ.0}AIQiw9E{wjMWf3Eu!+GGzcP][fqr+>m.QcqPKI&F7|' );
define( 'LOGGED_IN_KEY',    'ip>53;buUhwx@Q8FX4(]+uA^d!Ef(D|UN-tN>fE`2$Bgb6zbLDi7FuDFVa]_;QA^' );
define( 'NONCE_KEY',        's4Wrk1Lub8v3fJ7+_.Y/,P3UJ[8aW[d^x3+cEhns1Si(2T Ht&OQ4jB<r9SW,}(x' );
define( 'AUTH_SALT',        '_r=1&;T9;*>k<&*hql<J//[N5)MPD4J6#OsDp-5e#)=G2fKZ@qYp#y*09)2z_D:M' );
define( 'SECURE_AUTH_SALT', 'SmwFBMwu:v[Lg?>z*t~hy~bs/z<BS9{-:>OMNMVr6i [/v6&OM6l5}`P$ QDk8oG' );
define( 'LOGGED_IN_SALT',   'g4,#5a6!7W_hj>fK>R*g$LM^&[a-j?^qQ#QPMdTowu@FWBK?9DyQRJ4TLW=zurv ' );
define( 'NONCE_SALT',       '+>|AV?!]UN~=ggpF^c8R+hYNIC]k|R6d<!;PnO ~lbEGYu^W3y+U&# p)-[p0@ZN' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
