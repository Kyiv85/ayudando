<?php

/**
 * Custom template bootstrap menu for this theme ayuTheme.
 */
 require_once('wp_bootstrap_navwalker.php');
/**
 * ayuTheme functions and definitions
 *
 * @package ayuTheme
 */

/**
 * Set the content width based on the theme's design and stylesheet.
 */
if ( ! isset( $content_width ) ) {
	$content_width = 640; /* pixels */
}


if ( ! function_exists( 'ayuTheme_setup' ) ) :
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support for post thumbnails.
 */
function ayuTheme_setup() {

	/*
	 * Make theme available for translation.
	 * Translations can be filed in the /languages/ directory.
	 * If you're building a theme based on ayuTheme, use a find and replace
	 * to change 'ayuTheme' to the name of your theme in all the template files
	 */
	load_theme_textdomain( 'ayuTheme', get_template_directory() . '/languages' );
	add_theme_support( 'woocommerce' );
	// Add default posts and comments RSS feed links to head.
	add_theme_support( 'automatic-feed-links' );
	
	/*
	 * Switch default core markup for search form, comment form, and comments
	 * to output valid HTML5.
	 */
	add_theme_support( 'html5', array(
		'search-form', 'comment-form', 'comment-list', 'gallery', 'caption'
	) );

	/*
	 * Enable support for Post Formats.
	 * See http://codex.wordpress.org/Post_Formats
	 */
	add_theme_support( 'post-formats', array(
		'aside', 'image', 'video', 'quote', 'link'
	) );

	// Setup the WordPress core custom background feature.
	add_theme_support( 'custom-background', apply_filters( 'ayuTheme_custom_background_args', array(
		'default-color' => 'ffffff',
		'default-image' => '',
	) ) );
}
endif; // ayuTheme_setup
add_action( 'after_setup_theme', 'ayuTheme_setup' );

/**
 * Register widget area.
 *
 * @link http://codex.wordpress.org/Function_Reference/register_sidebar
 */



/* Theme setup */
add_action( 'after_setup_theme', 'wpt_setup' );
    if ( ! function_exists( 'wpt_setup' ) ):
        function wpt_setup() {  
            register_nav_menu( 'primary', __( 'Primary navigation', 'ayuTheme' ) );
        } endif;

add_action( 'after_setup_theme', 'wpt_setup' );
    if ( ! function_exists( 'wpt_setup' ) ):
        function wpt_setup() {  
            register_nav_menu( 'secundary', __( 'Secundary navigation', 'ayuTheme' ) );
        } endif;
/**
 * Enqueue scripts and styles.
 */
function ayuTheme_scripts() {
	wp_enqueue_style( 'animate', get_template_directory_uri() . '/css/animate.css');

	wp_enqueue_style( 'bootstrap', get_template_directory_uri() . '/css/bootstrap.css');

	wp_enqueue_style( 'bootstrap-min', get_template_directory_uri() . '/css/bootstrap.min.css' );

	wp_enqueue_style( 'landing-page', get_template_directory_uri() . '/css/landing-page.css' );

	wp_enqueue_style( 'font-awesome', get_template_directory_uri() . 'font-awesome/css/font-awesome.css');

	wp_enqueue_style( 'font-awesome-min', get_template_directory_uri() . 'font-awesome/css/font-awesome.min.css');

	wp_enqueue_style( 'font-awesome-cdn', 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css');

	wp_enqueue_style( 'google-apis', 'https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic');

	wp_enqueue_script( 'ayudando', get_template_directory_uri() . '/js/ayudando.js');

	wp_enqueue_script( 'bootstrap', get_template_directory_uri() . '/js/bootstrap.js');
	
	wp_enqueue_script( 'bootstrap-min', get_template_directory_uri() . '/js/bootstrap.min.js');

	wp_enqueue_script( 'contact-form-script', get_template_directory_uri() . '/js/contact-form-script.js');

	wp_enqueue_script( 'form-validator', get_template_directory_uri() . '/js/form-validator.js');

	wp_enqueue_script( 'jquery', get_template_directory_uri() . '/js/jquery.js');

	wp_enqueue_script( 'reCaptcha', 'https://www.google.com/recaptcha/api.js');

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'ayuTheme_scripts' );


//Sessions function
function register_session(){
    if(!session_id()) session_start();
}
add_action('init','register_session');


//Eliminar roles por defecto de WP
remove_role( 'subscriber' );
remove_role( 'editor' );
remove_role( 'contributor' );
remove_role( 'author' );

//Crear roles por defecto para la aplicación
add_role('empleado', __(
 'Empleado'),
 array(
 'read' => true, // Allows a user to read
 'create_posts' => true, // Allows user to create new posts
 'edit_posts' => true, // Allows user to edit their own posts
 'upload_files'=>true,
 )
);

add_role('empresa', __(
 'Empresa'),
 array(
 'read' => true, // Allows a user to read
 'create_posts' => true, // Allows user to create new posts
 'edit_posts' => true, // Allows user to edit their own posts
 'upload_files'=>true,
 )
);

/*add_filter('user_contactmethods','ayuTheme_user_contactmethods');
function ayuTheme_user_contactmethods( $contactmethods ) {

    $contactmethods['twitter'] = __('Twitter', 'textdomain');
    $contactmethods['facebook'] = __('Facebook', 'textdomain');
    $contactmethods['gplus'] = __('Google Plus', 'textdomain');
    $contactmethods['linkedin'] = __('Linkedin', 'textdomain');

    return $contactmethods;

}*/


//Registrar usuarios procesado por wp_ajax
add_action( 'wp_ajax_registracion_usuarios', 'prefix_ajax_registracion_usuarios' ); // Para usuarios logeados
add_action( 'wp_ajax_nopriv_registracion_usuarios', 'prefix_ajax_registracion_usuarios' ); // Para usuarios no logeados
//Escribimos la función de callback
function prefix_ajax_registracion_usuarios() {

	if (!isset($_POST['btnSubmit'])) 
	{
		//Primero se valida el reCaptcha al enviar el formulario
		//Key secret
        $secret = '6Lc2jyUUAAAAACkq3vjWTfP0RVINblfvPyzvgQrv';

       	//Get user's response
       	$captcha=$_POST['captcha'];

       	//User's ip
       	$ip = $_SERVER['REMOTE_ADDR'];

 		//Get verify response data
        $verifyResponse = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$secret.'&response='.$captcha.'&ip='.$ip);
        $responseData = json_decode($verifyResponse);
 
        //Enviar error si no se validó el reCaptcha
      	if(!($responseData->success)){
      		error_log("Error en el captcha, la respuesta fue ".$responseData);
		    wp_die("Captcha inválido");
      	}

		// Database connection
		$mysqli = new mysqli("localhost","root","root","wordpress");

		/* comprobar la conexión */
		if (mysqli_connect_errno()) {
		    error_log("Falló la conexión: %s\n", mysqli_connect_error());
		    wp_die("Ocurrió un problema al registrar el usuario. Por favor contacte al administrador");
		}

		//Validar qué tipo de ususario es y guardar los post en variables
		if ($_POST['tipousuario'] == 'Empleado') {
			$tipouser = $_POST['tipousuario'];
			$nacionalidad = trim($_POST['nacionalidad']);
			//$tipo = trim($_POST['tipo']);
			$documento = trim($_POST['documento']);
			$nombre = trim($_POST['nombre']);
			$apellido = trim($_POST['apellido']);
			$email = trim($_POST['email']);
			$telefono = trim($_POST['telefono']);
			$direccion = trim($_POST['direccion']);
			$clave = trim($_POST['clave']);

			//Validar que el correo del usuario no esté registrado
			try {
				$query = "SELECT user_email FROM wp_users WHERE user_email = '".$email."'";

				$res = $mysqli->query($query);

				$correo = "";
				while ($fila = $res->fetch_row()) {
		        	$correo = $fila[0];
		    	}

				if ($correo == $email) {
				    $res->close();
				    wp_die("El correo ingresado ya se encuentra registrado en la base de datos.");   
				}
				else{
					try {
						//Validar que el nombre de usuario no exista
						$query = "SELECT user_login FROM wp_users WHERE user_login = '".strtolower($nombre)."'";

						$res = $mysqli->query($query);

						$user_login = "";
						while ($fila = $res->fetch_row()) {
				        	$user_login = $fila[0];
				    	}

				    	//Si existe crear colocar user más el último id registrado PENDIENTE
						if ($user_login == strtolower($nombre)) {
						    $userexists="user".time();   
						}
						//Insertar el usuario a wp_users
						if(isset($userexists)){
							$new_user_id = wp_create_user(strtolower($userexists), $clave, $email);
						}
						else{
							$new_user_id = wp_create_user(strtolower($nombre), $clave, $email);
						}
						$query = "SELECT ID FROM wp_users WHERE user_email = '".$email."'";

						$res = $mysqli->query($query);

						//Se toma el id del usuario para insertar los meta values
						while ($fila = $res->fetch_row()) {
				        	$last_id = $fila[0];
				        	error_log("El last id es ".$last_id);
				    	}
						
						//Insertar metas de usuarios
						add_user_meta($last_id, 'nacionalidad', $nacionalidad, true);
						//add_user_meta($last_id, 'tipo_documento', $tipo, true);
						add_user_meta($last_id, 'documento', $documento, true);
						add_user_meta($last_id, 'telefono', $telefono, true);
						add_user_meta($last_id, 'direccion', $direccion);
						add_user_meta($last_id, 'email_verif', false, true);
						add_user_meta($last_id, 'foto_validacion1', '', true);
						add_user_meta($last_id, 'foto_validacion2', '', true);
						update_user_meta($last_id, 'first_name', $nombre);
						update_user_meta($last_id, 'last_name', $apellido);

						//Asignar el rol al usuario
						$user = new \WP_User($last_id);
						$user->set_role('empleado');

						//Enviar e-mail de confirmación al nuevo usuario
		                /*$user_data = get_userdata($last_id);
		                $to = $user_data->user_email;
		                $subject = "Gracias por registrarse en Referencia Laboral";
		                $message = 'Hola' .$user_data->user_login. ',' . "\r\n" .
		                        'agradecemos tu registro en nuestro site, para iniciar sesión utiliza tu correo ('.$user_data->user_login.') y el password que colocaste' . "\r\n\r\n" .
		                        "Para activar tu cuenta haz clic en el enlace siguiente:\n\n%s\n\n Luego podrás disfrutar de los beneficios de nuestro sistema. Realizar y recibir califaciones, y solicitar infomres. Luego te activar tu cuenta, te solicitaremos validarla enviándonos una foto de tu documento de identifcacion y otra tuya sosteniendo dicho documento. Muchas gracias!!!. \n\n";
		                        /* , ($user, $user_email, $key, $meta),site_url( "?page=gf_activation&key=$key" );*/
						/*$headers[] = 'From: Referencia Laboral';
		                wp_mail($to, $subject, $message, $headers);*/

		                //Enviar notificación al administrador del site
		                $to = 'dedd712@gmail.com';
		                $subject = "Nuevo usuario registrado en el portal";
		                $message = 'Se registró el nuevo usuario: ' . "\r\n\r\n" .
		                        '+ '.$user_data->user_login. "\r\n\r\n" .
		                $headers[] = 'From: Referencia Laboral';
		                wp_mail( $to, $subject, $message, $headers );

					} catch (Exception $e) {
					    $res->close();
					    error_log('Error insertando en la base de datos '.$e->getMessage());
					 	wp_die("Ocurrió un problema al registrar el usuario. Por favor contacte al administrador");   
					}
				}
				/* liberar el conjunto de resultados */
				$res->close();
				wp_die("success"); 
			} catch (Exception $e) {
				error_log('Error al realizar la consulta '.$e->getMessage());
			 	wp_die("Ocurrió un problema al registrar el usuario. Por favor contacte al administrador");
			}			
		}
		else{
			//Usuario empresa
			$tipouser = trim($_POST['tipousuario']);
			$cuit = trim($_POST['cuit']);
		    $razon = trim($_POST['razon']);
		    $nombreEmpre = trim($_POST['nombreEmpre']);
			$apellidoEmpre = trim($_POST['apellidoEmpre']);
			$emailEmpre = trim($_POST['emailEmpre']);
			$telefonoEmpre = trim($_POST['telefonoEmpre']);
			/*$direccionEmpre = trim($_POST['direccionEmpre']);
			$constancia = trim($_POST['constancia']);
			$responsable = trim($_POST['responsable']);*/
			$horario1 = trim($_POST['horario1']);
			$horario2 = trim($_POST['horario2']);
			$claveEmpre = trim($_POST['claveEmpre']);


			//Validar que el correo del usuario no esté registrado
			try {
				$query = "SELECT user_email FROM wp_users WHERE user_email = '".$emailEmpre."'";

				$res = $mysqli->query($query);

				$correo = '';
				while ($fila = $res->fetch_row()) {
		        	$correo = $fila[0];
		    	}

				/*if ($correo == $emailEmpre) {
				    $res->close();
				    wp_die("El correo ingresado ya se encuentra registrado en la base de datos.");   
				}
				else{*/
					try {
						//Insertar el usuario a wp_users
						$nicename = explode(" ", $razon);
						$new_user_id = wp_create_user(strtolower($nicename[0]), $claveEmpre, $emailEmpre);
						$query = "SELECT ID FROM wp_users WHERE user_email = '".$emailEmpre."'";

						$res = $mysqli->query($query);

						//Se toma el id del usuario para insertar los meta values
						while ($fila = $res->fetch_row()) {
				        	$last_id = $fila[0];
				    	}
						
						//Insertar metas de usuarios
						add_user_meta($last_id, 'cuit', $cuit, true);
						add_user_meta($last_id, 'razon_social', $razon, true);
						add_user_meta($last_id, 'telefono', $telefonoEmpre, true);
						add_user_meta($last_id, 'direccion', '', true);
						add_user_meta($last_id, 'constancia_inscripcion', '', true);
						add_user_meta($last_id, 'persona_responsable', '', true);
						add_user_meta($last_id, 'horario_desde', $horario1, true);
						add_user_meta($last_id, 'horario_hasta', $horario2, true);
						add_user_meta($last_id, 'email_verif', false, true);
						add_user_meta($last_id, 'foto_validacion1', '', true);
						add_user_meta($last_id, 'foto_validacion2', '', true);
						update_user_meta($last_id, 'first_name', $nombreEmpre);
						update_user_meta($last_id, 'last_name', $apellidoEmpre);

						//Asignar el rol al usuario
						$user = new \WP_User($last_id);
						$user->set_role('empresa');

						//Enviar e-mail de confirmación al nuevo usuario
		                /*$user_data = get_userdata($last_id);
		                $to = $user_data->user_email;
		                $subject = "Gracias por registrarse en Referencia Laboral";
		                $message = sprintf(__(( 'Hola' .$user_data->user_login. ',' . "\r\n" .
		                        'agradecemos tu registro en nuestro site, para iniciar sesión utiliza tu correo ('.$user_data->user_login.') y el password que colocaste' . "\r\n\r\n" .
		                        "Para activar tu cuenta haz clic en el enlace siguiente:\n\n%s\n\n Luego podrás disfrutar de los beneficios de nuestro sistema. Realizar y recibir califaciones, y solicitar infomres. Luego te activar tu cuenta, te solicitaremos validarla enviándonos una foto de tu documento de identifcacion y otra tuya sosteniendo dicho documento. Muchas gracias!!!. \n\n" ), $user, $user_email, $key, $meta),site_url( "?page=gf_activation&key=$key" ));
						$headers[] = 'From: Referencia Laboral';
		                wp_mail($to, $subject, $message, $headers);*/
		                
		                //Enviar notificación al administrador del site
		                $to = 'dedd712@gmail.com';
		                $subject = "Nuevo usuario registrado en el portal";
		                $message = 'Se registró el nuevo usuario: ' . "\r\n\r\n" .
		                        '+ '.$user_data->user_login. "\r\n\r\n" .
		                $headers[] = 'From: Referencia Laboral';
		                wp_mail( $to, $subject, $message, $headers );

					} catch (Exception $e) {
					    $res->close();
					    error_log('Error insertando en la base de datos '.$e->getMessage());
					 	wp_die("Ocurrió un problema al registrar el usuario. Por favor contacte al administrador");   
					}
				//}
				/* liberar el conjunto de resultados */
				$res->close();
				wp_die("success");
			} catch (Exception $e) {
				error_log('Error al realizar la consulta '.$e->getMessage());
			 	wp_die("Ocurrió un problema al registrar el usuario. Por favor contacte al administrador");
			}
		}
	}
	else{
		wp_die("Ya se envió el formulario");
	}
}

/* 
//Primero configuramos nombre y email del remitente
 
//Este es el filtro del mail de remitente:
 
add_filter('wp_mail_from', 'new_mail_from');
 
//Este es el filtro para el nombre del remitente:
 
add_filter('wp_mail_from_name', 'new_mail_from_name');
 
//Aquí es donde va el nuevo email remitente. Cámbialo a tu gusto
 
function new_mail_from($old) {
return 'miemail@midominio.com';
}
 
//Aquí es donde va el nombre del remitente
 
function new_mail_from_name($old) {
return 'Referencia Laboral';
}
 
//A continuación hacemos un gancho en el asunto y configuramos una función para cambiarlo
 
add_filter( 'wpmu_signup_user_notification_subject', 'my_activation_subject', 10, 4 );
 
function my_activation_subject( $text ) {
 
//Aquí es donde introducimos el nuevo asunto para el email de activación
 
return 'Gracias por registrarse en Referencia Laboral';
}
// Para finalizar hacemos un gancho en el email y ejecutamos una función para modificar el mensaje
 
add_filter('wpmu_signup_user_notification_email', 'my_custom_email_message', 10, 4);
 
function my_custom_email_message($message, $user, $user_email, $key) {
 
//Y este es el nuevo mensaje
 
$message = sprintf(__(( 'Hola,' . "\r\n" .
		                        'agradecemos tu registro en nuestro site, para iniciar sesión utiliza tu correo y el password que colocaste' . "\r\n\r\n" .
		                        'Para activar tu cuenta haz clic en el enlace siguiente:\n\n%s\n\n Luego podrás disfrutar de los beneficios de nuestro sistema. Realizar y recibir califaciones, y solicitar infomres. Luego te activar tu cuenta, te solicitaremos validarla enviándonos una foto de tu documento de identifcacion y otra tuya sosteniendo dicho documento. Muchas gracias!!!'."\n\n%s\n\n"  ),
$user, $user_email, $key, $meta),site_url( "?page=gf_activation&key=$key" ));
 
return sprintf($message);
 
}


/*function link_simple_toolbar( $wp_admin_bar ) {

	if ( ! is_admin() ) {
		$site_name     = new stdClass();
		$site_name->id = 'site-name';
		if ( is_user_logged_in() ) {
			$site_name->href = get_site_url() . '/streamline';
			$site_name->meta = array( 'class' => 'nopop', 'onclick' => 'goToAchievement()' );
//			$site_name->onclick = 'return true;';
//			$site_name->target = '_blank;';
		} else {
			$site_name->href = get_site_url();
		}
//		$site_name->meta = array( 'class' => 'logo-bar' );
		$wp_admin_bar->remove_node( 'site-name' );
		$wp_admin_bar->add_node( $site_name );

		$wp_admin_bar->remove_node( 'w3tc' );
		$wp_admin_bar->remove_node( 'wp-rocket' );
		$wp_admin_bar->remove_node( 'bar-analytics' );
		$wp_admin_bar->remove_node( 'cloudflare' );
	}

	$wp_admin_bar->remove_node( 'itsec_admin_bar_menu' );
	$wp_admin_bar->remove_node( 'revslider' );
	$wp_admin_bar->remove_node( 'wp-logo' );
	$wp_admin_bar->remove_node( 'comments' );
	$wp_admin_bar->remove_node( 'rtMedia' );
	$wp_admin_bar->remove_node( 'group-admin' );
	$wp_admin_bar->remove_node( 'edit-profile' );
	$wp_admin_bar->remove_menu( 'my-account-follow' );
	$wp_admin_bar->remove_menu( 'my-account-media' );
	$wp_admin_bar->remove_menu( 'un-usernoise' );
	$wp_admin_bar->remove_menu( 'wpseo-menu' );
	$wp_admin_bar->remove_menu( 'customize' );
	$wp_admin_bar->remove_menu( 'mail_bank' );
	$wp_admin_bar->remove_menu( 'wp_mail_bank' );

	if ( ! is_user_logged_in() ) {
		$url = $_SERVER['REQUEST_URI'];

		if ( strpos( $url, 'pending' ) == true ) {
			$wp_admin_bar->remove_menu( 'bp-login' );
			$wp_admin_bar->remove_menu( 'bp-register' );
		} else if ( is_page( 'welcome' ) || strpos( $url, 'complete' ) == true ) {
			$wp_admin_bar->remove_menu( 'bp-register' );
		} else {
			$wp_admin_bar->remove_menu( 'bp-login' );
			$wp_admin_bar->remove_menu( 'bp-register' );
			$link_enter = array(
				'id'     => 'bp-register',
				'parent' => 'top-secondary',
				'title'  => '<span class="ab-label">Login/Register</span>',
				'href'   => '#',
				'meta'   => array( 'title' => 'Enter' )
			);
			$wp_admin_bar->add_node( $link_enter );
		}

	}
	if ( is_user_logged_in() ) {
		global $bp;

		$wp_admin_bar->remove_menu( 'updates' );
		$wp_admin_bar->remove_menu( 'new-content' );
		$wp_admin_bar->remove_menu( 'edit' );
		$wp_admin_bar->remove_menu( 'user-admin' );

		$link_new_offer = array(
			'id'     => 'new-offer', // Identificador
			'parent' => 'top-secondary',
			'title'  => '<span class="ab-icon new-offer"></span><span class="ab-label"></span>',
			'href'   => $bp->loggedin_user->domain . 'free-offers/new_free_offer',
			'meta'   => array( 'title' => 'New Free Offer' )
		);

		$wp_admin_bar->add_node( $link_new_offer );

		if ( isset( $_GET['new_user'] ) ) {
			$title = '<span class="ab-icon new-dream first-dream"></span><span class="ab-label"></span>';
		} else {
			$title = '<span class="ab-icon new-dream"></span><span class="ab-label"></span>';
		}

		$link_new_dream = array(
			'id'     => 'new-dream', // Identificador
			'parent' => 'top-secondary',
			'title'  => $title,
			'href'   => $bp->loggedin_user->domain . 'dreams/new_dream',
			'meta'   => array( 'title' => 'New Dream' )
		);

		$wp_admin_bar->add_node( $link_new_dream );

		if ( function_exists( 'bp_get_loggedin_user_username' ) ):

			$myAccount        = (object) $wp_admin_bar->get_node( 'my-account' );
			$display_name     = $bp->loggedin_user->userdata->display_name;
			$user_login       = $bp->loggedin_user->userdata->user_login;
			$myAccount->href  = $bp->loggedin_user->domain;
			$avatar           = bp_get_loggedin_user_avatar( 'html=false' );
			$myAccount->title = 'Hi, ' . $display_name . ' <img src="' . $avatar . '" class="avatar user-3-avatar avatar-26 photo" width="26" height="26" />';
			$wp_admin_bar->add_node( $myAccount );

			$userInfo        = $wp_admin_bar->get_node( 'user-info' );
			$userInfo->title = '<img src="' . $avatar . '" class="avatar user-3-avatar avatar-64 photo" width="64" height="64" alt="Avatar" /><span class="display-name">' . $display_name . '</span><span class="username">' . $user_login . '</span>';
			$wp_admin_bar->add_node( $userInfo );

			$socialInvites = array(
				'id'     => 'my-account-social-invites',
				'parent' => 'my-account',
				'title'  => 'Invite Friends',
				'href'   => $bp->loggedin_user->domain . 'wp-social-invitations/',
				'meta'   => array( 'title' => 'Invite friends', 'class' => 'invitar-amigos' )
			);

			$wp_admin_bar->remove_node( 'my-account-social-invites' );
			$wp_admin_bar->add_node( $socialInvites );

//		$wp_admin_bar->remove_node('my-account-notifications');

		endif;
	}

	// Busqueda
	$search         = $wp_admin_bar->get_node( 'search' );
	$search->parent = 'root-default';
	$search->meta   = array( 'class' => 'search-bar' );
	$wp_admin_bar->remove_node( 'search' );
	$wp_admin_bar->add_node( $search );

	$link_offers = array(
		'id'     => 'offers',
		'parent' => 'top-secondary',
		'title'  => '<span class="ab-icon offers"></span><span class="ab-label"></span>',
		'href'   => home_url() . '/free-offers',
		'meta'   => array( 'title' => 'Free Offers, donations, free things and services.' )
	);
	$wp_admin_bar->add_node( $link_offers );

	$link_dreams = array(
		'id'     => 'dreams',
		'parent' => 'top-secondary',
		'title'  => '<span class="ab-icon dreams"></span><span class="ab-label"></span>',
		'href'   => home_url() . '/dreams',
		'meta'   => array( 'title' => 'Dreams, wishes, desires, needs and goals.' )
	);
	$wp_admin_bar->add_node( $link_dreams );

}

add_action( 'admin_bar_menu', 'link_simple_toolbar', 999 );*/


// La función no será utilizada antes del 'init'.
add_action( 'init', 'my_custom_init' );


function my_custom_init() {
        $labels = array(
        'name' => _x( 'Libros', 'post type general name' ),
        'singular_name' => _x( 'Libro', 'post type singular name' ),
        'add_new' => _x( 'Añadir nuevo', 'book' ),
        'add_new_item' => __( 'Añadir nuevo Libro' ),
        'edit_item' => __( 'Editar Libro' ),
        'new_item' => __( 'Nuevo Libro' ),
        'view_item' => __( 'Ver Libro' ),
        'search_items' => __( 'Buscar Libros' ),
        'not_found' =>  __( 'No se han encontrado Libros' ),
        'not_found_in_trash' => __( 'No se han encontrado Libros en la papelera' ),
        'parent_item_colon' => ''
    );
 
    // Creamos un array para $args
    $args = array( 'labels' => $labels,
        'public' => true,
        'publicly_queryable' => true,
        'show_ui' => true,
        'query_var' => true,
        'rewrite' => true,
        'capability_type' => 'post',
        'hierarchical' => false,
        'menu_position' => null,
        'supports' => array( 'title', 'editor', 'author', 'thumbnail', 'excerpt', 'comments' )
    );
 
    register_post_type( 'libro', $args ); 
}
