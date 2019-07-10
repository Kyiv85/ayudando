-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-07-2019 a las 12:32:21
-- Versión del servidor: 10.1.38-MariaDB-0+deb9u1
-- Versión de PHP: 7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wordpress`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un comentarista de WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2019-06-03 14:40:58', '2019-06-03 17:40:58', 'Hola, esto es un comentario.\nPara empezar a moderar, editar y borrar comentarios, por favor, visitá la pantalla de comentarios en el escritorio.\nLos avatares de los comentaristas provienen de <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0),
(2, 32, 'daniel', 'dedd712@gmail.com', '', '172.17.0.1', '2019-07-01 17:32:09', '2019-07-01 20:32:09', 'Este comentario es pa que seas serio', 0, '1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '', 0, 1),
(3, 32, 'daniel', 'dedd712@gmail.com', '', '172.17.0.1', '2019-07-01 18:10:38', '2019-07-01 21:10:38', 'No seas serio menol', 0, '1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '', 2, 1),
(4, 1, 'daniel', 'dedd712@gmail.com', '', '172.17.0.1', '2019-07-02 12:08:22', '2019-07-02 15:08:22', 'Esto es una prueba de respuesta', 0, '1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://172.17.0.2/ayudando/wordpress', 'yes'),
(2, 'home', 'http://172.17.0.2/ayudando/wordpress', 'yes'),
(3, 'blogname', 'Ayúdanos a Ayudar BA', 'yes'),
(4, 'blogdescription', 'Grupo de Ayuda creado por venezolanos en Buenos Aires', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'dedd712@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'j F, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:103:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:33:\"libro/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:43:\"libro/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:63:\"libro/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"libro/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:58:\"libro/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"libro/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:22:\"libro/([^/]+)/embed/?$\";s:38:\"index.php?libro=$matches[1]&embed=true\";s:26:\"libro/([^/]+)/trackback/?$\";s:32:\"index.php?libro=$matches[1]&tb=1\";s:34:\"libro/([^/]+)/page/?([0-9]{1,})/?$\";s:45:\"index.php?libro=$matches[1]&paged=$matches[2]\";s:41:\"libro/([^/]+)/comment-page-([0-9]{1,})/?$\";s:45:\"index.php?libro=$matches[1]&cpage=$matches[2]\";s:30:\"libro/([^/]+)(?:/([0-9]+))?/?$\";s:44:\"index.php?libro=$matches[1]&page=$matches[2]\";s:22:\"libro/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:32:\"libro/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:52:\"libro/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"libro/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:47:\"libro/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:28:\"libro/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:31:\"cookie-notice/cookie-notice.php\";i:1;s:32:\"disqus-comment-system/disqus.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '-3', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'ayuTheme', 'yes'),
(41, 'stylesheet', 'ayuTheme', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '44719', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '7', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'initial_db_version', '44719', 'yes'),
(94, 'wp_user_roles', 'a:3:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:8:\"empleado\";a:2:{s:4:\"name\";s:8:\"Empleado\";s:12:\"capabilities\";a:4:{s:4:\"read\";b:1;s:12:\"create_posts\";b:1;s:10:\"edit_posts\";b:1;s:12:\"upload_files\";b:1;}}s:7:\"empresa\";a:2:{s:4:\"name\";s:7:\"Empresa\";s:12:\"capabilities\";a:4:{s:4:\"read\";b:1;s:12:\"create_posts\";b:1;s:10:\"edit_posts\";b:1;s:12:\"upload_files\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'WPLANG', 'es_AR', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:2:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(103, 'cron', 'a:6:{i:1562773259;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1562780458;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1562780459;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1562780468;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1562780469;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(104, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'recovery_keys', 'a:0:{}', 'yes'),
(116, 'theme_mods_twentynineteen', 'a:3:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1561386643;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}s:18:\"nav_menu_locations\";a:0:{}}', 'yes'),
(123, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1562765975;s:7:\"checked\";a:4:{s:8:\"ayuTheme\";s:3:\"1.0\";s:14:\"twentynineteen\";s:3:\"1.4\";s:15:\"twentyseventeen\";s:3:\"2.2\";s:13:\"twentysixteen\";s:3:\"2.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(130, 'can_compress_scripts', '0', 'no'),
(143, 'ftp_credentials', 'a:3:{s:8:\"hostname\";s:9:\"localhost\";s:8:\"username\";s:6:\"daniel\";s:15:\"connection_type\";s:3:\"ftp\";}', 'yes'),
(160, 'current_theme', 'ayuTheme', 'yes'),
(161, 'theme_mods_ayuTheme', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1561995672;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(162, 'theme_switched', '', 'yes'),
(173, 'recently_activated', 'a:0:{}', 'yes'),
(178, 'cookie_notice_options', 'a:24:{s:12:\"message_text\";s:164:\"Usamos cookies para asegurarnos de darte la mejor experiencia de usuario durante tu estadía en nuestro site. Si aceptas, asumiremos que estás de acuerdo con ello.\";s:11:\"accept_text\";s:2:\"Ok\";s:12:\"see_more_opt\";a:5:{s:4:\"text\";s:14:\"Privacy policy\";s:9:\"link_type\";s:4:\"page\";s:2:\"id\";s:5:\"empty\";s:4:\"link\";s:0:\"\";s:4:\"sync\";b:0;}s:11:\"link_target\";s:6:\"_blank\";s:11:\"refuse_text\";s:2:\"No\";s:11:\"revoke_text\";s:14:\"Revoke cookies\";s:18:\"revoke_cookies_opt\";s:9:\"automatic\";s:16:\"refuse_code_head\";s:0:\"\";s:11:\"refuse_code\";s:0:\"\";s:16:\"on_scroll_offset\";i:100;s:4:\"time\";s:5:\"month\";s:16:\"script_placement\";s:6:\"header\";s:8:\"position\";s:6:\"bottom\";s:11:\"hide_effect\";s:4:\"fade\";s:9:\"css_style\";s:9:\"bootstrap\";s:9:\"css_class\";s:6:\"button\";s:6:\"colors\";a:2:{s:4:\"text\";s:4:\"#fff\";s:3:\"bar\";s:4:\"#000\";}s:10:\"refuse_opt\";s:2:\"no\";s:14:\"revoke_cookies\";b:0;s:9:\"on_scroll\";s:2:\"no\";s:11:\"redirection\";b:0;s:19:\"deactivation_delete\";s:2:\"no\";s:8:\"see_more\";s:2:\"no\";s:9:\"translate\";b:0;}', 'no'),
(179, 'cookie_notice_version', '1.2.46', 'no'),
(213, 'custom_permalinks_plugin_version', '1.5.0', 'yes'),
(250, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/es_AR/wordpress-5.2.2.zip\";s:6:\"locale\";s:5:\"es_AR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/es_AR/wordpress-5.2.2.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.2.2\";s:7:\"version\";s:5:\"5.2.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.0\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1562765973;s:15:\"version_checked\";s:5:\"5.2.2\";s:12:\"translations\";a:0:{}}', 'no'),
(256, 'theme_mods_twentyseventeen', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1561996212;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-1\";a:0:{}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(308, 'theme_switched_via_customizer', '', 'yes'),
(309, 'customize_stashed_theme_mods', 'a:0:{}', 'no'),
(335, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1562765975;s:7:\"checked\";a:4:{s:19:\"akismet/akismet.php\";s:5:\"4.1.2\";s:31:\"cookie-notice/cookie-notice.php\";s:6:\"1.2.46\";s:32:\"disqus-comment-system/disqus.php\";s:6:\"3.0.17\";s:9:\"hello.php\";s:5:\"1.7.2\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:4:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.2\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:31:\"cookie-notice/cookie-notice.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:27:\"w.org/plugins/cookie-notice\";s:4:\"slug\";s:13:\"cookie-notice\";s:6:\"plugin\";s:31:\"cookie-notice/cookie-notice.php\";s:11:\"new_version\";s:6:\"1.2.46\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/cookie-notice/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/cookie-notice.1.2.46.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/cookie-notice/assets/icon-256x256.png?rev=1805756\";s:2:\"1x\";s:66:\"https://ps.w.org/cookie-notice/assets/icon-128x128.png?rev=1805756\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:68:\"https://ps.w.org/cookie-notice/assets/banner-772x250.png?rev=1805749\";}s:11:\"banners_rtl\";a:0:{}}s:32:\"disqus-comment-system/disqus.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:35:\"w.org/plugins/disqus-comment-system\";s:4:\"slug\";s:21:\"disqus-comment-system\";s:6:\"plugin\";s:32:\"disqus-comment-system/disqus.php\";s:11:\"new_version\";s:6:\"3.0.17\";s:3:\"url\";s:52:\"https://wordpress.org/plugins/disqus-comment-system/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/disqus-comment-system.3.0.17.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:74:\"https://ps.w.org/disqus-comment-system/assets/icon-256x256.png?rev=1012448\";s:2:\"1x\";s:66:\"https://ps.w.org/disqus-comment-system/assets/icon.svg?rev=1636350\";s:3:\"svg\";s:66:\"https://ps.w.org/disqus-comment-system/assets/icon.svg?rev=1636350\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:76:\"https://ps.w.org/disqus-comment-system/assets/banner-772x250.png?rev=1636350\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(336, 'disqus_sync_token', '15a849332ca1e4771acdff9d678b405b', 'yes'),
(361, '_site_transient_timeout_theme_roots', '1562767774', 'no'),
(362, '_site_transient_theme_roots', 'a:4:{s:8:\"ayuTheme\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(5, 7, '_wp_attached_file', '2019/06/favicon.ico'),
(6, 7, '_wp_attachment_metadata', 'a:4:{s:5:\"width\";i:16;s:6:\"height\";i:16;s:4:\"file\";s:19:\"2019/06/favicon.ico\";s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(9, 8, '_edit_lock', '1561582173:1'),
(10, 11, '_edit_lock', '1561577134:1'),
(11, 14, '_wp_attached_file', '2019/06/Seminario_3.jpg'),
(12, 14, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:800;s:6:\"height\";i:800;s:4:\"file\";s:23:\"2019/06/Seminario_3.jpg\";s:5:\"sizes\";a:3:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"Seminario_3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"Seminario_3-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:23:\"Seminario_3-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(13, 16, '_edit_lock', '1559847405:1'),
(15, 8, '_edit_last', '1'),
(16, 22, '_edit_lock', '1561382667:1'),
(17, 23, '_edit_lock', '1561382940:1'),
(18, 22, '_wp_trash_meta_status', 'draft'),
(19, 22, '_wp_trash_meta_time', '1561383095'),
(20, 22, '_wp_desired_post_slug', ''),
(21, 23, '_wp_trash_meta_status', 'draft'),
(22, 23, '_wp_trash_meta_time', '1561383097'),
(23, 23, '_wp_desired_post_slug', ''),
(30, 32, '_edit_lock', '1562767353:1'),
(31, 32, '_wp_page_template', 'page-templates/page-blog.php'),
(32, 38, '_wp_trash_meta_status', 'publish'),
(33, 38, '_wp_trash_meta_time', '1561992407'),
(34, 45, '_edit_lock', '1562082413:1'),
(35, 46, '_wp_attached_file', '2019/07/descarga-1.jpeg'),
(36, 46, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:318;s:6:\"height\";i:159;s:4:\"file\";s:23:\"2019/07/descarga-1.jpeg\";s:5:\"sizes\";a:2:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"descarga-1-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:23:\"descarga-1-300x150.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2019-06-03 14:40:58', '2019-06-03 17:40:58', '<!-- wp:paragraph -->\n<p>Bienvenido a WordPress. Esta es tu primera entrada. Editala o borrala, y después empezá a escribir!</p>\n<!-- /wp:paragraph -->', '¡Hola mundo!', '', 'publish', 'open', 'open', '', 'hola-mundo', '', '', '2019-06-03 14:40:58', '2019-06-03 17:40:58', '', 0, 'http://172.17.0.2/ayudando/wordpress/?p=1', 0, 'post', '', 2),
(2, 1, '2019-06-03 14:40:58', '2019-06-03 17:40:58', '<!-- wp:paragraph -->\n<p>Esta es una página de ejemplo, es diferente de una entrada porque se va a quedar en un solo lugar y va a aparecer en la navegación de tu sitio (en la mayoría de los temas). Muchas gente empieza con una página del tipo \"Sobre Mí\", que los introduce a los potenciales visitantes de su sitio. Podés decir algo como esto:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>¡Hola! Soy mensajero en bicicleta de día, actor aspirante de noche, y esta es mi página web. Vivo en Los Ángeles, tengo un gran perro llamado Jack, y me gustan las piñas coladas. (Y ser atrapado por la lluvia.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...o algo como esto:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>La compañia XYZ Trasto fue fundada en 1971, y provee trastos de calidad para el público desde entonces. Ubicado en Ciudad Gótica, XYZ le da empleo a más de 2000 personas y hace todo tipo de cosas asombrosas para la comunidad de Gótica.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Como nuevo usuario de WordPress, deberías dirigirte a <a href=\"http://172.17.0.2/ayudando/wordpress/wp-admin/\">tu escritorio</a> para borrar esta página y crear nuevas páginas para tu contenido. Divertite!</p>\n<!-- /wp:paragraph -->', 'Página de ejemplo', '', 'publish', 'closed', 'open', '', 'pagina-ejemplo', '', '', '2019-06-03 14:40:58', '2019-06-03 17:40:58', '', 0, 'http://172.17.0.2/ayudando/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2019-06-03 14:40:58', '2019-06-03 17:40:58', '<!-- wp:heading --><h2>Quiénes somos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>La dirección de nuestra web es: http://172.17.0.2/ayudando/wordpress.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué datos personales recogemos y por qué</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comentarios</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Cuando los visitantes dejan comentarios en la web, recopilamos los datos que se muestran en el formulario de comentarios, así como la dirección IP del visitante y la cadena de agentes de usuario del navegador, para ayudar a la detección de spam.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Una cadena anónima creada a partir de tu dirección de correo electrónico (también llamada hash) puede ser proporcionada al servicio de Gravatar para ver si la estás usando. La política de privacidad del servicio Gravatar está disponible en https://automattic.com/privacy/. Después de la aprobación de tu comentario, la imagen de tu perfil será visible para el público en el contexto de su comentario.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Multimedia</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si subís imágenes a la web deberías evitar subir imágenes con datos de ubicación (GPS EXIF) incluidos. Los visitantes de la web pueden descargar y extraer cualquier dato de localización de las imágenes de la web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Formularios de contacto</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si dejás un comentario en nuestro sitio, podés optar por guardar tu nombre, dirección de correo electrónico y sitio web en las cookies. Estos son para tu conveniencia para que no tengas que volver a ingresar tus datos cuando dejés otro comentario. Estas cookies durarán un año.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si tenés una cuenta e iniciás sesión en este sitio, estableceremos una cookie temporal para determinar si tu navegador acepta cookies. Esta cookie no contiene datos personales y es descartada al cerrar el navegador.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Cuando iniciás sesión, también configuraremos varias cookies para guardar tu información de inicio de sesión y tus opciones de visualización en pantalla. Las cookies de inicio de sesión duran dos días y las cookies de opciones de pantalla duran un año. Si seleccionás &quot;Recordarme&quot;, tu inicio de sesión se mantendrá durante dos semanas. Si cerrás la sesión, se eliminarán las cookies de inicio de sesión.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si editás o publicás un artículo, se guardará una cookie adicional en tu navegador. Esta cookie no incluye datos personales y simplemente indica el ID de publicación del artículo que acabás de editar. Caduca después de 1 día.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contenido embebido desde otros sitios web</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Los artículos en este sitio pueden incluir contenido incrustado (por ejemplo, videos, imágenes, artículos, etc.). El contenido incrustado de otros sitios web se comporta de la misma manera que si el visitante hubiera visitado el otro sitio web.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Estos sitios web pueden recopilar tus datos, utilizar cookies, incrustar un sistema de seguimiento de terceros y supervisar su interacción con ese contenido incrustado, incluyendo el rastreo de tu interacción con el contenido incrustado si tenés una cuenta y estás conectado a ese sitio web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Estadísticas</h3><!-- /wp:heading --><!-- wp:heading --><h2>Con quién compartimos datos</h2><!-- /wp:heading --><!-- wp:heading --><h2>Cuánto tiempo guardamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si dejás un comentario, el comentario y sus metadatos se conservan indefinidamente. Esto es para que podamos reconocer y aprobar cualquier comentario de seguimiento de forma automática en lugar de mantenerlos en una cola de moderación.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Para los usuarios que se registran en nuestro sitio web (si corresponde), también almacenamos la información personal que proporcionan en su perfil de usuario. Todos los usuarios pueden ver, editar o eliminar su información personal en cualquier momento (excepto que no pueden cambiar su nombre de usuario). Los administradores del sitio web también pueden ver y editar esa información.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Qué derechos tenés sobre tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si tenés una cuenta en este sitio o has dejado comentarios, podés solicitar un archivo exportado de los datos personales tuyos que tenemos, incluidos los datos que nos hayas proporcionado. También podés solicitar que borremos cualquier dato personal tuyo que tengamos. Esto no incluye datos que estamos obligados a mantener para fines administrativos, legales o de seguridad.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Adónde enviamos tus datos</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Los comentarios de los visitantes se pueden verificar a través de un servicio automático de detección de spam.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Tu información de contacto</h2><!-- /wp:heading --><!-- wp:heading --><h2>Información adicional</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cómo protegemos tus datos</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>¿Qué procedimientos de violación de datos tenemos en marcha?</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>De quiénes (terceros) recibimos datos</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Qué toma de decisiones y/o perfiles automatizados se realizan con los datos del usuario</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Requisitos de divulgación regulatoria de la industria</h3><!-- /wp:heading -->', 'Política de privacidad', '', 'draft', 'closed', 'open', '', 'politica-privacidad', '', '', '2019-06-03 14:40:58', '2019-06-03 17:40:58', '', 0, 'http://172.17.0.2/ayudando/wordpress/?page_id=3', 0, 'page', '', 0),
(7, 1, '2019-06-06 15:03:48', '2019-06-06 18:03:48', '', 'favicon', '', 'inherit', 'open', 'closed', '', 'favicon', '', '', '2019-06-06 15:03:48', '2019-06-06 18:03:48', '', 0, 'http://172.17.0.2/ayudando/wordpress/wp-content/uploads/2019/06/favicon.ico', 0, 'attachment', 'image/x-icon', 0),
(8, 1, '2019-06-06 15:25:07', '2019-06-06 18:25:07', '<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-lg-12 col-sm-12\">\n\n<hr class=\"section-heading-spacer\">\n\n<div class=\"clearfix\"></div>\n<h2 class=\"section-heading\">Participamos en el proyecto:</h2>\n<ul>\n 	<li>\n<p class=\"lead\">Laurys</p>\n</li>\n 	<li>\n<p class=\"lead\">Zaraid</p>\n</li>\n 	<li>\n<p class=\"lead\">Daniel</p>\n</li>\n 	<li>\n<p class=\"lead\">Milagros</p>\n</li>\n 	<li>\n<p class=\"lead\">Mauricio</p>\n</li>\n 	<li>\n<p class=\"lead\">Astrid</p>\n</li>\n 	<li>\n<p class=\"lead\">Yindriska</p>\n</li>\n</ul>\n<h3 class=\"section-heading\">Para comunicarte con nosotros lo puedes hacer por el correo: ayudanosayudarba@gmail.com</h3>\n</div>\n</div>\n</div>\n<!-- /.container -->', 'Contacto', '', 'publish', 'closed', 'closed', '', 'contacto', '', '', '2019-06-07 11:10:03', '2019-06-07 14:10:03', '', 0, 'http://172.17.0.2/ayudando/wordpress/?page_id=8', 0, 'page', '', 0),
(9, 1, '2019-06-06 15:25:04', '2019-06-06 18:25:04', '<div class=\"intro-header\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-lg-12\">\n<div class=\"intro-message\" style=\"padding-top:5px;padding-bottom:5px;\">\n<h1>Contacto</h1>\n</div>\n</div>\n</div>\n</div>\n<!-- /.container -->\n\n</div>\n<a name=\"services\"></a>\n<div class=\"content-section-a\">\n<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-lg-12 col-sm-12\">\n\n<hr class=\"section-heading-spacer\">\n\n<div class=\"clearfix\"></div>\n<h2 class=\"section-heading\">Participamos en el proyecto:</h2>\n<ul>\n 	<li>\n<p class=\"lead\">Laurys</p>\n</li>\n 	<li>\n<p class=\"lead\">Zaraid</p>\n</li>\n 	<li>\n<p class=\"lead\">Daniel</p>\n</li>\n 	<li>\n<p class=\"lead\">Milagros</p>\n</li>\n 	<li>\n<p class=\"lead\">Mauricio</p>\n</li>\n 	<li>\n<p class=\"lead\">Astrid</p>\n</li>\n 	<li>\n<p class=\"lead\">Yindriska</p>\n</li>\n</ul>\n<h3 class=\"section-heading\">Para comunicarte con nosotros lo puedes hacer por el correo: ayudanosayudarba@gmail.com</h3>\n</div>\n</div>\n</div>\n<!-- /.container -->\n\n</div>\n<!-- /.content-section-a -->', 'Contacto', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2019-06-06 15:25:04', '2019-06-06 18:25:04', '', 8, 'http://172.17.0.2/ayudando/wordpress/index.php/2019/06/06/8-revision-v1/', 0, 'revision', '', 0),
(10, 1, '2019-06-06 15:41:07', '2019-06-06 18:41:07', '<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-lg-12 col-sm-12\">\n\n<hr class=\"section-heading-spacer\">\n\n<div class=\"clearfix\"></div>\n<h2 class=\"section-heading\">Participamos en el proyecto:</h2>\n<ul>\n 	<li>\n<p class=\"lead\">Laurys</p>\n</li>\n 	<li>\n<p class=\"lead\">Zaraid</p>\n</li>\n 	<li>\n<p class=\"lead\">Daniel</p>\n</li>\n 	<li>\n<p class=\"lead\">Milagros</p>\n</li>\n 	<li>\n<p class=\"lead\">Mauricio</p>\n</li>\n 	<li>\n<p class=\"lead\">Astrid</p>\n</li>\n 	<li>\n<p class=\"lead\">Yindriska</p>\n</li>\n</ul>\n<h3 class=\"section-heading\">Para comunicarte con nosotros lo puedes hacer por el correo: ayudanosayudarba@gmail.com</h3>\n</div>\n</div>\n</div>\n<!-- /.container -->', 'Contacto', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2019-06-06 15:41:07', '2019-06-06 18:41:07', '', 8, 'http://172.17.0.2/ayudando/wordpress/index.php/2019/06/06/8-revision-v1/', 0, 'revision', '', 0),
(11, 1, '2019-06-06 15:49:37', '2019-06-06 18:49:37', '<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-lg-12 col-sm-12\">\n\n<hr class=\"section-heading-spacer\" />\n\n<div class=\"clearfix\"></div>\n<h2 class=\"section-heading\">Seminario Perfílate Laboralmente</h2>\n<div class=\"row\" style=\"margin-top: 30px;\">\n<div class=\"col-lg-12 col-sm-12\">\n<p class=\"lead\">Con mucho agrado te invitamos este domingo 15 de Abril de 8:00 a 13:00 a nuestro seminario, donde se tratarán distintos temas para apoyarte a conseguir un perfil laboral exitoso.</p>\n<p class=\"lead\">Si estás interesado en asistir regístrate <a href=\"registro.php\">aquí</a> y nos pondremos en contacto contigo.</p>\n<p class=\"lead\"><b>¿El seminario es gratuito?</b></p>\n<p class=\"lead\">Sí, es completamente Gratuito.</p>\n<p class=\"lead\"><b>¿Es para venezolanos únicamente?</b></p>\n<p class=\"lead\">Sí. Debido a que estaremos orientando el seminario principalmente a venezolanos sin empleo.</p>\n<p class=\"lead\"><b>¿Cómo me registro?</b></p>\n<p class=\"lead\">En nuestra página web como lo indica la publicación.</p>\n<p class=\"lead\"><b>¿Es para cualquier persona así no sea graduada/o?</b></p>\n<p class=\"lead\">Si, para todos los graduados universitarios o técnicos, así como para personas con un oficio o los que jamás hayan trabajado desde que llegaron.</p>\n<p class=\"lead\"><b>¿Donde será el seminario?</b></p>\n<p class=\"lead\">Buenos Aires. Capital Federal.</p>\n\n</div>\n</div>\n<div class=\"text-center\"><img class=\"alignnone size-medium wp-image-14\" src=\"http://172.17.0.2/ayudando/wordpress/wp-content/uploads/2019/06/Seminario_3-300x300.jpg\" alt=\"\" width=\"300\" height=\"300\" /></div>\n</div>\n</div>\n<!-- End Content Section  -->\n\n</div>\n<!-- /.container -->', 'Eventos', '', 'publish', 'closed', 'closed', '', 'eventos', '', '', '2019-06-06 15:52:46', '2019-06-06 18:52:46', '', 0, 'http://172.17.0.2/ayudando/wordpress/?page_id=11', 0, 'page', '', 0),
(12, 1, '2019-06-06 15:49:37', '2019-06-06 18:49:37', '<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-lg-12 col-sm-12\">\n\n<hr class=\"section-heading-spacer\">\n\n<div class=\"clearfix\"></div>\n<h2 class=\"section-heading\">Seminario Perfílate Laboralmente</h2>\n<div class=\"row\" style=\"margin-top: 30px;\">\n<div class=\"col-lg-12 col-sm-12\">\n<p class=\"lead\">Con mucho agrado te invitamos este domingo 15 de Abril de 8:00 a 13:00 a nuestro seminario, donde se tratarán distintos temas para apoyarte a conseguir un perfil laboral exitoso.</p>\n<p class=\"lead\">Si estás interesado en asistir regístrate <a href=\"registro.php\">aquí</a> y nos pondremos en contacto contigo.</p>\n\n<p class=\"lead\">\n                  <b>¿El seminario es gratuito?</b>\n\n<p class=\"lead\">\n                  Sí, es completamente Gratuito.\n\n<p class=\"lead\">\n                  <b>¿Es para venezolanos únicamente?</b>\n\n<p class=\"lead\">\n                  Sí. Debido a que estaremos orientando el seminario principalmente a venezolanos sin empleo.\n\n<p class=\"lead\">\n                  <b>¿Cómo me registro?</b>\n\n<p class=\"lead\">\n                  En nuestra página web como lo indica la publicación.\n\n<p class=\"lead\">\n                  <b>¿Es para cualquier persona así no sea graduada/o?</b>\n\n<p class=\"lead\">\n                  Si, para todos los graduados universitarios o técnicos, así como para personas con un oficio o los que jamás hayan trabajado desde que llegaron.\n\n<p class=\"lead\">\n                  <b>¿Donde será el seminario?</b>\n\n<p class=\"lead\">\n                  Buenos Aires. Capital Federal.\n\n</div>\n</div>\n<div class=\"text-center\">\n              <img src=\"img/flyer.jpg\" class=\"rounded mx-auto d-block img-responsive center-block\" alt=\"Flyer\"></div>\n</div>\n</div>\n<!-- End Content Section  -->\n\n</div>\n<!-- /.container -->', 'Eventos', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2019-06-06 15:49:37', '2019-06-06 18:49:37', '', 11, 'http://172.17.0.2/ayudando/wordpress/index.php/2019/06/06/11-revision-v1/', 0, 'revision', '', 0),
(13, 1, '2019-06-06 15:50:37', '2019-06-06 18:50:37', '<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-lg-12 col-sm-12\">\n\n<hr class=\"section-heading-spacer\">\n\n<div class=\"clearfix\"></div>\n<h2 class=\"section-heading\">Seminario Perfílate Laboralmente</h2>\n<div class=\"row\" style=\"margin-top: 30px;\">\n<div class=\"col-lg-12 col-sm-12\">\n<p class=\"lead\">Con mucho agrado te invitamos este domingo 15 de Abril de 8:00 a 13:00 a nuestro seminario, donde se tratarán distintos temas para apoyarte a conseguir un perfil laboral exitoso.</p>\n<p class=\"lead\">Si estás interesado en asistir regístrate <a href=\"registro.php\">aquí</a> y nos pondremos en contacto contigo.</p>\n\n<p class=\"lead\">\n                  <b>¿El seminario es gratuito?</b>\n\n<p class=\"lead\">\n                  Sí, es completamente Gratuito.\n\n<p class=\"lead\">\n                  <b>¿Es para venezolanos únicamente?</b>\n\n<p class=\"lead\">\n                  Sí. Debido a que estaremos orientando el seminario principalmente a venezolanos sin empleo.\n\n<p class=\"lead\">\n                  <b>¿Cómo me registro?</b>\n\n<p class=\"lead\">\n                  En nuestra página web como lo indica la publicación.\n\n<p class=\"lead\">\n                  <b>¿Es para cualquier persona así no sea graduada/o?</b>\n\n<p class=\"lead\">\n                  Si, para todos los graduados universitarios o técnicos, así como para personas con un oficio o los que jamás hayan trabajado desde que llegaron.\n\n<p class=\"lead\">\n                  <b>¿Donde será el seminario?</b>\n\n<p class=\"lead\">\n                  Buenos Aires. Capital Federal.\n\n</div>\n</div>\n<div class=\"text-center\">\n              <img src=\"<?php echo get_template_directory_uri(); ?>/img/flyer.jpg\" class=\"rounded mx-auto d-block img-responsive center-block\" alt=\"Flyer\"></div>\n</div>\n</div>\n<!-- End Content Section  -->\n\n</div>\n<!-- /.container -->', 'Eventos', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2019-06-06 15:50:37', '2019-06-06 18:50:37', '', 11, 'http://172.17.0.2/ayudando/wordpress/index.php/2019/06/06/11-revision-v1/', 0, 'revision', '', 0),
(14, 1, '2019-06-06 15:52:38', '2019-06-06 18:52:38', '', 'Seminario_3', '', 'inherit', 'open', 'closed', '', 'seminario_3', '', '', '2019-06-06 15:52:38', '2019-06-06 18:52:38', '', 11, 'http://172.17.0.2/ayudando/wordpress/wp-content/uploads/2019/06/Seminario_3.jpg', 0, 'attachment', 'image/jpeg', 0),
(15, 1, '2019-06-06 15:52:46', '2019-06-06 18:52:46', '<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-lg-12 col-sm-12\">\n\n<hr class=\"section-heading-spacer\" />\n\n<div class=\"clearfix\"></div>\n<h2 class=\"section-heading\">Seminario Perfílate Laboralmente</h2>\n<div class=\"row\" style=\"margin-top: 30px;\">\n<div class=\"col-lg-12 col-sm-12\">\n<p class=\"lead\">Con mucho agrado te invitamos este domingo 15 de Abril de 8:00 a 13:00 a nuestro seminario, donde se tratarán distintos temas para apoyarte a conseguir un perfil laboral exitoso.</p>\n<p class=\"lead\">Si estás interesado en asistir regístrate <a href=\"registro.php\">aquí</a> y nos pondremos en contacto contigo.</p>\n<p class=\"lead\"><b>¿El seminario es gratuito?</b></p>\n<p class=\"lead\">Sí, es completamente Gratuito.</p>\n<p class=\"lead\"><b>¿Es para venezolanos únicamente?</b></p>\n<p class=\"lead\">Sí. Debido a que estaremos orientando el seminario principalmente a venezolanos sin empleo.</p>\n<p class=\"lead\"><b>¿Cómo me registro?</b></p>\n<p class=\"lead\">En nuestra página web como lo indica la publicación.</p>\n<p class=\"lead\"><b>¿Es para cualquier persona así no sea graduada/o?</b></p>\n<p class=\"lead\">Si, para todos los graduados universitarios o técnicos, así como para personas con un oficio o los que jamás hayan trabajado desde que llegaron.</p>\n<p class=\"lead\"><b>¿Donde será el seminario?</b></p>\n<p class=\"lead\">Buenos Aires. Capital Federal.</p>\n\n</div>\n</div>\n<div class=\"text-center\"><img class=\"alignnone size-medium wp-image-14\" src=\"http://172.17.0.2/ayudando/wordpress/wp-content/uploads/2019/06/Seminario_3-300x300.jpg\" alt=\"\" width=\"300\" height=\"300\" /></div>\n</div>\n</div>\n<!-- End Content Section  -->\n\n</div>\n<!-- /.container -->', 'Eventos', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2019-06-06 15:52:46', '2019-06-06 18:52:46', '', 11, 'http://172.17.0.2/ayudando/wordpress/index.php/2019/06/06/11-revision-v1/', 0, 'revision', '', 0),
(16, 1, '2019-06-06 15:59:07', '2019-06-06 18:59:07', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta excepturi maxime doloremque, corrupti dolor accusamus veniam officia in voluptatem quas? Vel, ab corrupti. Incidunt inventore similique, temporibus provident iste consectetur.Saepe consequatur quam totam, a cumque nostrum adipisci eveniet recusandae voluptatibus vel, labore quisquam. Voluptatem nostrum in, perferendis quasi ipsam explicabo. Dignissimos quia consequatur repudiandae accusantium molestiae, molestias amet corrupti.Praesentium autem iure consequuntur quis eius illo? Laudantium nesciunt illo ea repudiandae a ipsum non labore officia aliquid, minima perspiciatis excepturi quam itaque suscipit veritatis. Amet quo saepe nostrum neque.Fugiat, tempora sint voluptatum aut eaque quos iure? Nostrum odit veritatis repellendus possimus sint. Nostrum nemo libero dolores ad ut id nulla possimus natus! Perspiciatis a aliquid in officia inventore.Quas veritatis similique tenetur nam, expedita unde recusandae fugiat ullam deleniti ipsam corrupti error, culpa odio officia enim, dolore eos iste quae illo totam. Adipisci at quos non cum perferendis.Ex delectus explicabo debitis totam quam? Suscipit praesentium consequatur repudiandae accusantium ipsam voluptatem dicta dolores quo consequuntur temporibus optio dolorem aliquid quas quasi, magni ducimus voluptatibus maiores consectetur aut reprehenderit!Sapiente quasi illo quibusdam eum qui vel aspernatur sed molestiae delectus fuga doloremque veniam, exercitationem dolorem. Iusto architecto impedit, quibusdam, possimus reprehenderit blanditiis aliquid reiciendis placeat adipisci vero debitis eum!Perferendis, reiciendis cum. Explicabo facere assumenda voluptatum quae dicta nisi, consequatur quos. Quas consequatur incidunt omnis delectus sequi, voluptate, sunt temporibus modi asperiores assumenda id beatae esse, debitis laborum expedita.Minus quae laborum dolore, atque placeat dignissimos veniam id perspiciatis repellat quaerat suscipit magni, quod sint, cupiditate consequuntur eius consequatur aut consectetur delectus tempore provident. Commodi, iure dolorum. Hic, commodi!Dolorem laboriosam rerum voluptate consequatur placeat error quo illum in laborum enim veniam delectus suscipit, corrupti ad, exercitationem nemo ab sed harum explicabo? Deleniti reprehenderit impedit eveniet deserunt! Sit, possimus?Saepe fugit sit cupiditate minima consequatur ipsum dolores sunt quo sed? Dolorum aut provident dolor, deserunt exercitationem impedit consectetur dignissimos, tenetur incidunt nam cum blanditiis modi quo itaque vitae saepe!Repellat voluptatibus quis corporis magnam totam earum expedita, fugit quos quod excepturi aliquam maxime itaque ipsa consequatur quo, dignissimos ab commodi numquam culpa officiis perspiciatis odio? Labore minus tempore harum.Et labore dolores sapiente aliquid quidem, id neque voluptas iste nesciunt vitae inventore dolore, veritatis omnis architecto? Quidem error ullam, in nesciunt ab asperiores, deleniti tempore voluptates dolores reprehenderit obcaecati?Nesciunt quasi odio laboriosam amet autem molestias consequatur, officiis ea itaque a atque aspernatur voluptas sint quo assumenda officia consequuntur fugit minus, provident enim labore laborum architecto expedita modi? Voluptatem!Fuga suscipit vero adipisci tempora repudiandae, magnam, odit dicta, eos esse necessitatibus aut est. Esse voluptas, blanditiis sit earum fugit nesciunt adipisci atque deserunt amet nemo, assumenda exercitationem. Alias, placeat?Cupiditate accusantium perferendis quibusdam est, sunt doloremque, quia sequi aliquam libero repellat nobis non fuga qui voluptatem dolorem cum a eveniet corrupti pariatur. Aperiam porro inventore harum eveniet magni iure?Mollitia temporibus corrupti, inventore labore doloremque quibusdam numquam officiis officia, consectetur reprehenderit odit ipsum laborum! Voluptatem hic esse quidem in deserunt exercitationem earum laudantium, fuga at voluptas amet laboriosam eius?Impedit, consequuntur. Sint eum quis molestias eius aperiam dolorum sit magni, ducimus a tenetur, nam, saepe accusantium soluta ea at blanditiis excepturi et non eligendi nobis asperiores dignissimos aspernatur architecto!Ratione, atque illo laboriosam, eligendi debitis, fugit quod ducimus molestias dignissimos cumque mollitia facilis! Obcaecati laudantium veniam, minima, qui ullam autem perspiciatis unde, velit consequuntur eius et quas? Unde, neque.Nisi tempora, officiis delectus aliquam vero nulla consequuntur? Eos inventore a hic quae ducimus maiores ab quod nisi laborum alias quam, maxime quis similique voluptatum laudantium explicabo voluptas, quibusdam illum.Quisquam ab, cumque dolor, amet iure dolorem earum rem pariatur voluptate tempora perspiciatis doloribus dolorum temporibus laboriosam accusantium ex molestiae quod saepe enim reprehenderit itaque impedit. Sed cupiditate dignissimos iure.Possimus odit sit autem officia! Ea nulla modi unde itaque corrupti eum voluptatum natus deleniti commodi dolores consectetur porro rem non incidunt a laborum quia, tenetur dicta! Nesciunt, aliquam nostrum?Officiis doloribus ratione iusto eveniet quisquam dolor esse culpa! Architecto molestias rerum fugit saepe optio. Tempora modi odit iusto maxime, dolor iste in error recusandae dolores natus ipsa inventore tenetur!Tempora veniam earum vel sequi animi eum at nulla dolorem nemo nostrum iure qui, itaque culpa vitae excepturi commodi nihil ipsa velit quam natus et iste aliquid. Eos, velit eius.Error minima beatae nisi eum cum magni rerum. Praesentium laudantium dolorum soluta possimus saepe earum hic minima repellat rerum exercitationem eligendi omnis deserunt, nemo molestiae doloribus excepturi eum quisquam esse.Ipsa, a possimus! Consectetur atque, dolorem consequuntur molestias aut voluptatem aperiam perferendis dolorum dolore fuga cum, sed non reiciendis, illo eaque suscipit. Ducimus facilis neque aperiam quia dolorem voluptatem dolor?Recusandae odit quasi obcaecati blanditiis doloribus possimus vel voluptatibus veritatis sequi optio nostrum officia laboriosam consequatur illo tempore maiores aspernatur architecto, magni quas dolorum officiis rerum quam? Consequatur, delectus eaque!Ducimus, pariatur. Nesciunt ipsa, autem, architecto quia, molestias laudantium magnam aliquid ratione maxime animi magni amet a sed et deserunt unde beatae optio. Necessitatibus, error quos! Expedita sapiente inventore saepe.Nobis, dolor qui, possimus omnis eligendi illo dolorum dolorem molestias repellendus, ut facere maiores ex quaerat fuga porro incidunt voluptatibus temporibus ea exercitationem reprehenderit atque quo magnam. Cum, voluptatum ullam?Officiis est minus optio corrupti doloribus ad blanditiis doloremque, assumenda voluptates modi incidunt? Labore, id a distinctio rem voluptates dicta! Recusandae commodi tenetur optio veritatis assumenda soluta in veniam saepe!Quae esse animi ad repellat magni? Provident a, doloribus illum ab numquam molestiae eligendi vero nesciunt amet mollitia. Rerum aliquid officia corrupti laborum aut necessitatibus ex inventore, iusto beatae hic.Quasi accusantium explicabo ea beatae quisquam id distinctio obcaecati perferendis. Labore natus cum facere dolores tempore enim debitis, incidunt atque? Sint maiores perferendis veritatis. Cupiditate praesentium vero sequi natus aut.Facilis laboriosam molestiae quas quisquam tenetur ipsam est vitae consectetur quod perferendis facere possimus eaque quam delectus natus, mollitia consequatur reprehenderit necessitatibus odio eius beatae nemo expedita? Harum, sunt unde?Facere corrupti fuga minima, omnis saepe sint aperiam voluptate? Voluptatibus sunt provident nesciunt earum itaque commodi nam accusantium consequuntur error quo laboriosam expedita, suscipit repellendus! Omnis voluptatibus eius in quam!Distinctio inventore ab ex animi eligendi dolorem consequatur esse! Eaque ut id vitae, consequatur quia temporibus officiis. Sequi, ullam omnis. At corrupti modi, ea ab minima nostrum rerum odit accusantium.Voluptates quos ipsam accusamus quod suscipit vitae expedita a laboriosam deleniti eligendi, magnam vero nemo consectetur odit doloribus iure autem amet placeat velit dolor, ad corrupti magni! At, cum debitis?Suscipit perspiciatis harum quo qui voluptates dolore expedita eveniet. Voluptas laborum deleniti totam facere nihil ducimus quaerat animi omnis fugiat. Rem enim dolorem perspiciatis odit quisquam similique, labore ipsam ex.Debitis, quisquam accusantium. Eius pariatur dolorum quidem architecto sapiente neque impedit blanditiis provident placeat, aut consequatur consectetur non fuga beatae saepe iste. Officia vitae ipsum quam quis ad odio inventore!Esse maxime animi voluptatibus repellendus harum dicta dignissimos veniam odio ratione, quis numquam debitis nihil magni fugiat quaerat doloribus, minima quibusdam id! Aperiam ut optio dignissimos, deleniti odio quae sed.Veritatis quae voluptatum, voluptatibus blanditiis quam quod delectus nihil corrupti perspiciatis temporibus debitis sint tempore, porro explicabo ducimus quaerat. Dignissimos suscipit modi temporibus repudiandae, veniam eum veritatis neque fugiat similique.Magni, autem nam vel sequi exercitationem aspernatur! Cum eveniet aperiam provident exercitationem sint, obcaecati amet sunt et, minus quis impedit, porro soluta rerum a saepe consequatur vel quisquam quam quia.Quis ea odit aliquid, distinctio animi necessitatibus! Unde similique consequatur ut inventore sint, vel perspiciatis architecto qui, earum modi sequi libero suscipit repellendus? Adipisci numquam aperiam vel, cupiditate ipsam neque.Corporis animi deleniti dolorum excepturi consectetur fuga atque ducimus perspiciatis odio ipsa, quis possimus magni nesciunt tenetur! Repudiandae, totam. Vitae alias recusandae ex illum harum corporis dolore necessitatibus earum aut.Recusandae praesentium voluptas similique quasi asperiores ex, voluptatem sint maiores itaque sunt ea voluptatibus quae exercitationem quisquam omnis perspiciatis ab repellendus rerum aperiam suscipit? Dolor natus nostrum voluptatibus fugit asperiores!Officiis est aspernatur eveniet possimus tenetur eos ipsum quod quas neque assumenda. Illum sunt, molestias quidem iste voluptatibus ab nostrum repudiandae earum beatae odio dolorem alias nobis est. Dicta, illum.Saepe, consequatur iure. Esse nisi eos, numquam aliquid in incidunt, perferendis illo officiis provident eum laboriosam? Voluptate delectus, repellat consequuntur temporibus, alias incidunt rem numquam nihil quae voluptatibus, quo deleniti!Quidem libero sint doloribus illo doloremque fugit, odio soluta explicabo, eaque magnam corrupti deleniti suscipit optio voluptas dolor veniam distinctio ex quibusdam excepturi tempore quam saepe molestiae fugiat temporibus. Ipsum?Non doloremque modi aliquid tenetur eaque fuga quasi laudantium ullam itaque vitae tempore velit saepe harum qui corporis, vel ipsam aliquam tempora provident officia natus? Voluptate amet error quam a.Recusandae non animi ex magnam veniam commodi cum. Nesciunt neque perferendis vel aut sunt blanditiis ab molestiae sed consectetur saepe fuga natus corporis, quaerat repudiandae magnam praesentium laudantium porro. Laboriosam!Sit enim natus, modi perferendis beatae animi id sint velit est praesentium quidem labore, provident et tempora dolorum expedita fuga ex necessitatibus alias veniam quam ullam voluptatum minus. Illum, voluptatum.Aut dolores saepe consectetur. Aliquam delectus optio sit nisi architecto obcaecati veritatis quaerat iure. Voluptatibus reiciendis itaque cumque, repellat quam qui explicabo officia exercitationem quos quo sed nostrum laudantium odit.Eligendi iusto ab cum corporis culpa quasi suscipit consequatur deserunt sapiente recusandae consequuntur veritatis, necessitatibus quis enim ad expedita id possimus, fuga amet dolorem architecto porro quidem! Nemo, eveniet rerum?A optio dicta beatae perspiciatis in quod saepe culpa vel suscipit incidunt, expedita, dignissimos molestiae numquam at sit velit tempora explicabo ipsam repudiandae modi dolorum magnam. Recusandae laborum cumque eius.Aliquam at, voluptas facilis ipsum libero iusto nobis vero sunt eligendi eius qui quisquam aut eaque aperiam illo ab eum ea, pariatur assumenda tempore est. Tempora minima natus delectus aut.Et voluptate quidem ducimus cum officiis accusantium maxime, quibusdam neque ratione! Incidunt rerum eveniet voluptatibus. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Mamalo</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Provident quaerat, necessitatibus sed aperiam quasi quibusdam vel earum vero illum facilis quos error dolorem.Eos magnam voluptates quas expedita architecto neque, unde rem explicabo deleniti. Natus molestiae ullam et nulla exercitationem obcaecati, nostrum at non sit aperiam quos tempore quo accusamus placeat ex consequatur.Id atque quis labore error eaque. Blanditiis dolore incidunt ipsum quo aspernatur, doloremque maiores perspiciatis ex vel totam! Doloremque, perspiciatis ducimus sit iste rem quibusdam neque voluptatibus illum? Quam, consequuntur!Vero necessitatibus a obcaecati nam id ut, recusandae cupiditate non deserunt ipsam tempora soluta eius earum molestiae sapiente nobis incidunt voluptates alias impedit possimus sequi doloribus voluptatum ad illo? Aspernatur.Ut cumque adipisci blanditiis, sint tempora, et doloribus accusantium enim a nam temporibus molestias unde eos? Dolore quo dicta, ullam cum voluptates quod totam necessitatibus itaque nostrum est, pariatur autem.Consequatur quo corrupti, quasi magnam suscipit odit cumque commodi et totam. Perferendis ipsam facilis quam dolor, nesciunt doloremque tempore labore doloribus delectus repellendus nemo ipsum, molestiae dolorem, suscipit vitae quas.Asperiores quisquam, perferendis ducimus sed consequuntur molestiae ad eligendi officiis delectus, optio impedit reprehenderit velit, possimus corporis? Quis illum maxime fugiat facere ipsa corrupti sed, necessitatibus officiis quisquam et iusto!Nam rem, possimus maxime debitis eveniet dignissimos dolorum dicta repellat unde alias est voluptas vero ipsa reprehenderit, illum fuga quam dolorem harum. Qui, saepe ut nemo voluptate nam corporis dolores.Perspiciatis vel saepe perferendis ipsum aspernatur ipsam voluptates aperiam quisquam voluptas delectus repudiandae distinctio itaque, hic accusantium. Adipisci ipsam fuga non voluptatem ea possimus iusto ipsa quis praesentium distinctio! Odio?Itaque nulla neque, enim maiores cum vel, sapiente quo dicta non, beatae corrupti explicabo autem officiis dolorum perspiciatis eos repellat dolores earum. Enim reprehenderit nulla dolore deleniti dicta quia. Voluptates?Natus vel eius repudiandae ullam molestiae deserunt doloribus excepturi itaque obcaecati architecto numquam, maxime aspernatur doloremque tempore odio corporis tenetur magnam provident iste harum! Laudantium fugit aliquam mollitia sint saepe.Placeat qui, aut iure odit earum dolores ut hic saepe alias doloribus perferendis mollitia aperiam voluptates eum exercitationem nobis vero molestiae et molestias obcaecati dolorem! Tempora quos aliquid itaque vel!Dignissimos perspiciatis eligendi voluptates rerum deleniti, velit quos, reprehenderit optio quas asperiores consequuntur. Recusandae ab distinctio totam? Veritatis culpa debitis, molestias sequi eum illo reprehenderit neque omnis earum odit libero.Amet, commodi necessitatibus nemo dolorum aliquid iusto delectus impedit consequuntur mollitia animi eaque, voluptatem, aut magni inventore? Quis amet numquam harum iste sit nemo assumenda, adipisci, eligendi sequi distinctio provident.Nisi ab alias doloremque nemo, possimus debitis dicta aliquid suscipit, accusamus labore impedit adipisci perferendis. Cupiditate perspiciatis quia pariatur incidunt adipisci dolores ad. Soluta id nobis consectetur expedita ducimus provident?Officiis, qui aperiam ipsa explicabo distinctio architecto facilis, quod, sunt at eaque quae asperiores tempore tenetur doloribus illo hic delectus fugit sed aliquam totam error dolore dicta in incidunt? Veritatis.Laborum, voluptate quas eaque enim minima quia officia, commodi quisquam sunt atque, deleniti est. Nihil officia doloremque, nesciunt quidem soluta asperiores ipsa incidunt nemo fugiat ex, ea minus, fuga magnam.Corporis ipsam blanditiis optio rerum? Labore blanditiis eligendi architecto, dolor dicta eaque perferendis maiores illo consectetur nam reprehenderit voluptatum, et nesciunt, culpa a in unde optio omnis. Delectus, rem quas!Sunt quod minima laboriosam ducimus. Suscipit sequi nesciunt velit commodi corporis tempore dolorem adipisci, quae, eum voluptatibus quas reprehenderit cum doloremque numquam veritatis et modi impedit rerum nulla aspernatur perferendis?Nostrum perferendis totam expedita minus vel possimus, quam accusantium, impedit in ratione dolores! Rem veniam laborum odio non facere ipsam necessitatibus et quae. Alias rerum neque eveniet suscipit voluptatibus quaerat.Recusandae cum laborum, eum, distinctio dolore quod minima nulla sit quaerat sunt sed sapiente nostrum exercitationem veniam, quo amet ipsa. Dolorum accusamus mollitia explicabo veritatis cumque cum quod porro veniam.Cumque neque architecto magni dolorum! Neque quia possimus veritatis quidem beatae eligendi voluptate! Facilis reprehenderit id error eum pariatur quas voluptates necessitatibus quam dolorum, itaque optio officiis accusamus quo odit.Maxime nihil aliquid voluptatem tempora obcaecati, laborum adipisci minima quasi esse ipsa vitae modi, quaerat non, est magni ea officiis sapiente nostrum sunt ducimus debitis cupiditate porro? Magnam, nobis. Dolores.Optio illo accusamus sint consequatur expedita deserunt blanditiis, possimus inventore? Cumque, ullam alias ipsa quae sapiente magni itaque id ex, repellendus dolorem asperiores expedita eligendi quibusdam! Molestias non quod accusantium.Neque fuga nulla rerum vitae quibusdam tempora voluptates eligendi, error deserunt culpa delectus magnam rem recusandae cumque provident at vel libero non illum quas? Sequi at eveniet placeat corrupti atque?Dolore minima, suscipit enim, architecto officia exercitationem quasi quidem dolorem repudiandae iusto delectus perspiciatis rem molestias neque assumenda! Quas, ipsum nesciunt? Accusamus amet eligendi voluptas ipsum perferendis deserunt incidunt ipsam.Aut facilis sapiente nostrum explicabo voluptatem a? Nobis facilis quae nisi excepturi quis neque, deleniti enim magni aut ipsam magnam aliquam deserunt consectetur asperiores ratione corrupti itaque in totam quasi!Tempore numquam consequuntur ex voluptas aut dignissimos autem minus iure, ratione officia asperiores veritatis explicabo illo suscipit perspiciatis cumque necessitatibus accusantium dolorum mollitia obcaecati a laudantium soluta ab doloribus. Quasi.Porro, quos? Maiores blanditiis, incidunt itaque tenetur officiis quasi numquam, accusamus mollitia possimus doloribus nesciunt odit exercitationem ab. Quam cupiditate placeat quis velit laborum quisquam aliquam tenetur ducimus dolor sequi!Officiis officia natus quibusdam, porro nostrum eveniet incidunt totam qui cupiditate explicabo temporibus quos, nesciunt exercitationem asperiores accusamus odit dignissimos quod optio cum ratione. Fuga obcaecati maiores eligendi voluptas inventore.Nesciunt quas nihil non cupiditate dolores? Neque rem, nam similique, dolore quibusdam voluptatibus consequatur rerum ipsa odio enim quam quia at aliquid consequuntur error ad officia, est eos possimus eum.Distinctio nulla blanditiis fuga culpa esse, maxime ad placeat adipisci quis id, neque rerum facere quae rem. Necessitatibus exercitationem earum molestiae, a cupiditate temporibus! Neque natus quod alias ratione laboriosam.Tempore vero minima tenetur officia itaque soluta, iste sunt eveniet possimus sequi labore laudantium maiores omnis ullam placeat aspernatur numquam? Corrupti voluptate possimus magnam adipisci! Non, dolor. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Vuelvelo a mamar</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Eveniet, veniam quo!Delectus possimus nemo quam modi corrupti ipsum dolor perspiciatis. Voluptatum, ducimus quidem, molestias ea aliquid sed consectetur eos maiores soluta id ipsam consequatur, vel qui aspernatur maxime deserunt harum delectus.Quibusdam illum nostrum exercitationem porro accusantium, impedit placeat facere perspiciatis magnam tempore. Doloremque, blanditiis rerum, aliquid beatae repellat necessitatibus molestiae iusto maxime voluptas doloribus tempora accusamus ipsam expedita odio impedit.Vitae facilis pariatur velit veniam? Sapiente, voluptatibus. Veniam doloribus perspiciatis dolore odio? Dolor nostrum modi, officia alias repellendus corporis consectetur repellat sapiente architecto inventore quod praesentium in voluptates eveniet labore.Mollitia, necessitatibus, id modi nemo ducimus reiciendis eligendi corrupti laboriosam adipisci eveniet similique ipsam error quibusdam esse blanditiis eum quod dolor a temporibus? Labore animi enim amet sapiente illo aliquam!Vitae iure cupiditate dolor molestiae sequi sint molestias, rerum deserunt quae ex quas explicabo omnis quidem aut distinctio tempore reiciendis eligendi illo aspernatur facere officia veritatis neque voluptates perferendis. Dolorem.Deleniti ipsam iure fugit esse eius nihil non magnam! Soluta quas, optio, ad corrupti voluptates amet tempora incidunt quam sint, repellat odio sit molestias veritatis suscipit aut! Porro, magni ipsum.Iste deserunt perferendis velit assumenda inventore. Quae eius culpa, deleniti veritatis maxime dolor reiciendis repudiandae delectus porro harum quos unde ipsa cupiditate omnis aliquam voluptatibus, vitae magni eum. Ducimus, asperiores?Enim iusto nobis repellat reiciendis praesentium quisquam quidem voluptatum est beatae soluta numquam quo exercitationem voluptate, dolore in obcaecati distinctio repellendus dolor blanditiis sunt. Dignissimos molestias consequatur consequuntur quibusdam magnam.Dolores, deleniti velit placeat officiis ut voluptatibus quasi quod nihil delectus ullam exercitationem eaque molestias saepe inventore impedit nobis, illo voluptate. Ipsam explicabo quaerat magni minus vel assumenda mollitia! Qui?Atque quo quas similique quasi itaque corporis animi natus quaerat quam sit ipsam nihil, molestiae cupiditate rerum mollitia ad, hic dolor autem perspiciatis. Voluptatum, sequi aut magni fuga vero nam.Nemo harum aspernatur perferendis veniam sunt ipsum, explicabo, animi praesentium quaerat vero sint quo obcaecati modi quia adipisci maiores, esse a nam. Nemo ratione totam explicabo nobis ut, voluptatum magni!Modi, fugit delectus maxime officiis ipsa quas corrupti illo magni consequuntur? Officia totam quasi sunt necessitatibus omnis ducimus libero autem, illo eligendi est fuga tempore aut ut quos officiis ullam.Molestias doloremque aspernatur obcaecati veritatis voluptatem? Sunt totam facilis necessitatibus doloremque aspernatur consequuntur quam? Necessitatibus assumenda, recusandae distinctio inventore aperiam blanditiis voluptates velit voluptatibus quaerat quis sed mollitia, eveniet voluptas.</p>\n<!-- /wp:paragraph -->', 'Prueba', '', 'publish', 'open', 'open', '', 'prueba', '', '', '2019-06-06 15:59:07', '2019-06-06 18:59:07', '', 0, 'http://172.17.0.2/ayudando/wordpress/?p=16', 0, 'post', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(17, 1, '2019-06-06 15:59:07', '2019-06-06 18:59:07', '<!-- wp:paragraph -->\n<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta excepturi maxime doloremque, corrupti dolor accusamus veniam officia in voluptatem quas? Vel, ab corrupti. Incidunt inventore similique, temporibus provident iste consectetur.Saepe consequatur quam totam, a cumque nostrum adipisci eveniet recusandae voluptatibus vel, labore quisquam. Voluptatem nostrum in, perferendis quasi ipsam explicabo. Dignissimos quia consequatur repudiandae accusantium molestiae, molestias amet corrupti.Praesentium autem iure consequuntur quis eius illo? Laudantium nesciunt illo ea repudiandae a ipsum non labore officia aliquid, minima perspiciatis excepturi quam itaque suscipit veritatis. Amet quo saepe nostrum neque.Fugiat, tempora sint voluptatum aut eaque quos iure? Nostrum odit veritatis repellendus possimus sint. Nostrum nemo libero dolores ad ut id nulla possimus natus! Perspiciatis a aliquid in officia inventore.Quas veritatis similique tenetur nam, expedita unde recusandae fugiat ullam deleniti ipsam corrupti error, culpa odio officia enim, dolore eos iste quae illo totam. Adipisci at quos non cum perferendis.Ex delectus explicabo debitis totam quam? Suscipit praesentium consequatur repudiandae accusantium ipsam voluptatem dicta dolores quo consequuntur temporibus optio dolorem aliquid quas quasi, magni ducimus voluptatibus maiores consectetur aut reprehenderit!Sapiente quasi illo quibusdam eum qui vel aspernatur sed molestiae delectus fuga doloremque veniam, exercitationem dolorem. Iusto architecto impedit, quibusdam, possimus reprehenderit blanditiis aliquid reiciendis placeat adipisci vero debitis eum!Perferendis, reiciendis cum. Explicabo facere assumenda voluptatum quae dicta nisi, consequatur quos. Quas consequatur incidunt omnis delectus sequi, voluptate, sunt temporibus modi asperiores assumenda id beatae esse, debitis laborum expedita.Minus quae laborum dolore, atque placeat dignissimos veniam id perspiciatis repellat quaerat suscipit magni, quod sint, cupiditate consequuntur eius consequatur aut consectetur delectus tempore provident. Commodi, iure dolorum. Hic, commodi!Dolorem laboriosam rerum voluptate consequatur placeat error quo illum in laborum enim veniam delectus suscipit, corrupti ad, exercitationem nemo ab sed harum explicabo? Deleniti reprehenderit impedit eveniet deserunt! Sit, possimus?Saepe fugit sit cupiditate minima consequatur ipsum dolores sunt quo sed? Dolorum aut provident dolor, deserunt exercitationem impedit consectetur dignissimos, tenetur incidunt nam cum blanditiis modi quo itaque vitae saepe!Repellat voluptatibus quis corporis magnam totam earum expedita, fugit quos quod excepturi aliquam maxime itaque ipsa consequatur quo, dignissimos ab commodi numquam culpa officiis perspiciatis odio? Labore minus tempore harum.Et labore dolores sapiente aliquid quidem, id neque voluptas iste nesciunt vitae inventore dolore, veritatis omnis architecto? Quidem error ullam, in nesciunt ab asperiores, deleniti tempore voluptates dolores reprehenderit obcaecati?Nesciunt quasi odio laboriosam amet autem molestias consequatur, officiis ea itaque a atque aspernatur voluptas sint quo assumenda officia consequuntur fugit minus, provident enim labore laborum architecto expedita modi? Voluptatem!Fuga suscipit vero adipisci tempora repudiandae, magnam, odit dicta, eos esse necessitatibus aut est. Esse voluptas, blanditiis sit earum fugit nesciunt adipisci atque deserunt amet nemo, assumenda exercitationem. Alias, placeat?Cupiditate accusantium perferendis quibusdam est, sunt doloremque, quia sequi aliquam libero repellat nobis non fuga qui voluptatem dolorem cum a eveniet corrupti pariatur. Aperiam porro inventore harum eveniet magni iure?Mollitia temporibus corrupti, inventore labore doloremque quibusdam numquam officiis officia, consectetur reprehenderit odit ipsum laborum! Voluptatem hic esse quidem in deserunt exercitationem earum laudantium, fuga at voluptas amet laboriosam eius?Impedit, consequuntur. Sint eum quis molestias eius aperiam dolorum sit magni, ducimus a tenetur, nam, saepe accusantium soluta ea at blanditiis excepturi et non eligendi nobis asperiores dignissimos aspernatur architecto!Ratione, atque illo laboriosam, eligendi debitis, fugit quod ducimus molestias dignissimos cumque mollitia facilis! Obcaecati laudantium veniam, minima, qui ullam autem perspiciatis unde, velit consequuntur eius et quas? Unde, neque.Nisi tempora, officiis delectus aliquam vero nulla consequuntur? Eos inventore a hic quae ducimus maiores ab quod nisi laborum alias quam, maxime quis similique voluptatum laudantium explicabo voluptas, quibusdam illum.Quisquam ab, cumque dolor, amet iure dolorem earum rem pariatur voluptate tempora perspiciatis doloribus dolorum temporibus laboriosam accusantium ex molestiae quod saepe enim reprehenderit itaque impedit. Sed cupiditate dignissimos iure.Possimus odit sit autem officia! Ea nulla modi unde itaque corrupti eum voluptatum natus deleniti commodi dolores consectetur porro rem non incidunt a laborum quia, tenetur dicta! Nesciunt, aliquam nostrum?Officiis doloribus ratione iusto eveniet quisquam dolor esse culpa! Architecto molestias rerum fugit saepe optio. Tempora modi odit iusto maxime, dolor iste in error recusandae dolores natus ipsa inventore tenetur!Tempora veniam earum vel sequi animi eum at nulla dolorem nemo nostrum iure qui, itaque culpa vitae excepturi commodi nihil ipsa velit quam natus et iste aliquid. Eos, velit eius.Error minima beatae nisi eum cum magni rerum. Praesentium laudantium dolorum soluta possimus saepe earum hic minima repellat rerum exercitationem eligendi omnis deserunt, nemo molestiae doloribus excepturi eum quisquam esse.Ipsa, a possimus! Consectetur atque, dolorem consequuntur molestias aut voluptatem aperiam perferendis dolorum dolore fuga cum, sed non reiciendis, illo eaque suscipit. Ducimus facilis neque aperiam quia dolorem voluptatem dolor?Recusandae odit quasi obcaecati blanditiis doloribus possimus vel voluptatibus veritatis sequi optio nostrum officia laboriosam consequatur illo tempore maiores aspernatur architecto, magni quas dolorum officiis rerum quam? Consequatur, delectus eaque!Ducimus, pariatur. Nesciunt ipsa, autem, architecto quia, molestias laudantium magnam aliquid ratione maxime animi magni amet a sed et deserunt unde beatae optio. Necessitatibus, error quos! Expedita sapiente inventore saepe.Nobis, dolor qui, possimus omnis eligendi illo dolorum dolorem molestias repellendus, ut facere maiores ex quaerat fuga porro incidunt voluptatibus temporibus ea exercitationem reprehenderit atque quo magnam. Cum, voluptatum ullam?Officiis est minus optio corrupti doloribus ad blanditiis doloremque, assumenda voluptates modi incidunt? Labore, id a distinctio rem voluptates dicta! Recusandae commodi tenetur optio veritatis assumenda soluta in veniam saepe!Quae esse animi ad repellat magni? Provident a, doloribus illum ab numquam molestiae eligendi vero nesciunt amet mollitia. Rerum aliquid officia corrupti laborum aut necessitatibus ex inventore, iusto beatae hic.Quasi accusantium explicabo ea beatae quisquam id distinctio obcaecati perferendis. Labore natus cum facere dolores tempore enim debitis, incidunt atque? Sint maiores perferendis veritatis. Cupiditate praesentium vero sequi natus aut.Facilis laboriosam molestiae quas quisquam tenetur ipsam est vitae consectetur quod perferendis facere possimus eaque quam delectus natus, mollitia consequatur reprehenderit necessitatibus odio eius beatae nemo expedita? Harum, sunt unde?Facere corrupti fuga minima, omnis saepe sint aperiam voluptate? Voluptatibus sunt provident nesciunt earum itaque commodi nam accusantium consequuntur error quo laboriosam expedita, suscipit repellendus! Omnis voluptatibus eius in quam!Distinctio inventore ab ex animi eligendi dolorem consequatur esse! Eaque ut id vitae, consequatur quia temporibus officiis. Sequi, ullam omnis. At corrupti modi, ea ab minima nostrum rerum odit accusantium.Voluptates quos ipsam accusamus quod suscipit vitae expedita a laboriosam deleniti eligendi, magnam vero nemo consectetur odit doloribus iure autem amet placeat velit dolor, ad corrupti magni! At, cum debitis?Suscipit perspiciatis harum quo qui voluptates dolore expedita eveniet. Voluptas laborum deleniti totam facere nihil ducimus quaerat animi omnis fugiat. Rem enim dolorem perspiciatis odit quisquam similique, labore ipsam ex.Debitis, quisquam accusantium. Eius pariatur dolorum quidem architecto sapiente neque impedit blanditiis provident placeat, aut consequatur consectetur non fuga beatae saepe iste. Officia vitae ipsum quam quis ad odio inventore!Esse maxime animi voluptatibus repellendus harum dicta dignissimos veniam odio ratione, quis numquam debitis nihil magni fugiat quaerat doloribus, minima quibusdam id! Aperiam ut optio dignissimos, deleniti odio quae sed.Veritatis quae voluptatum, voluptatibus blanditiis quam quod delectus nihil corrupti perspiciatis temporibus debitis sint tempore, porro explicabo ducimus quaerat. Dignissimos suscipit modi temporibus repudiandae, veniam eum veritatis neque fugiat similique.Magni, autem nam vel sequi exercitationem aspernatur! Cum eveniet aperiam provident exercitationem sint, obcaecati amet sunt et, minus quis impedit, porro soluta rerum a saepe consequatur vel quisquam quam quia.Quis ea odit aliquid, distinctio animi necessitatibus! Unde similique consequatur ut inventore sint, vel perspiciatis architecto qui, earum modi sequi libero suscipit repellendus? Adipisci numquam aperiam vel, cupiditate ipsam neque.Corporis animi deleniti dolorum excepturi consectetur fuga atque ducimus perspiciatis odio ipsa, quis possimus magni nesciunt tenetur! Repudiandae, totam. Vitae alias recusandae ex illum harum corporis dolore necessitatibus earum aut.Recusandae praesentium voluptas similique quasi asperiores ex, voluptatem sint maiores itaque sunt ea voluptatibus quae exercitationem quisquam omnis perspiciatis ab repellendus rerum aperiam suscipit? Dolor natus nostrum voluptatibus fugit asperiores!Officiis est aspernatur eveniet possimus tenetur eos ipsum quod quas neque assumenda. Illum sunt, molestias quidem iste voluptatibus ab nostrum repudiandae earum beatae odio dolorem alias nobis est. Dicta, illum.Saepe, consequatur iure. Esse nisi eos, numquam aliquid in incidunt, perferendis illo officiis provident eum laboriosam? Voluptate delectus, repellat consequuntur temporibus, alias incidunt rem numquam nihil quae voluptatibus, quo deleniti!Quidem libero sint doloribus illo doloremque fugit, odio soluta explicabo, eaque magnam corrupti deleniti suscipit optio voluptas dolor veniam distinctio ex quibusdam excepturi tempore quam saepe molestiae fugiat temporibus. Ipsum?Non doloremque modi aliquid tenetur eaque fuga quasi laudantium ullam itaque vitae tempore velit saepe harum qui corporis, vel ipsam aliquam tempora provident officia natus? Voluptate amet error quam a.Recusandae non animi ex magnam veniam commodi cum. Nesciunt neque perferendis vel aut sunt blanditiis ab molestiae sed consectetur saepe fuga natus corporis, quaerat repudiandae magnam praesentium laudantium porro. Laboriosam!Sit enim natus, modi perferendis beatae animi id sint velit est praesentium quidem labore, provident et tempora dolorum expedita fuga ex necessitatibus alias veniam quam ullam voluptatum minus. Illum, voluptatum.Aut dolores saepe consectetur. Aliquam delectus optio sit nisi architecto obcaecati veritatis quaerat iure. Voluptatibus reiciendis itaque cumque, repellat quam qui explicabo officia exercitationem quos quo sed nostrum laudantium odit.Eligendi iusto ab cum corporis culpa quasi suscipit consequatur deserunt sapiente recusandae consequuntur veritatis, necessitatibus quis enim ad expedita id possimus, fuga amet dolorem architecto porro quidem! Nemo, eveniet rerum?A optio dicta beatae perspiciatis in quod saepe culpa vel suscipit incidunt, expedita, dignissimos molestiae numquam at sit velit tempora explicabo ipsam repudiandae modi dolorum magnam. Recusandae laborum cumque eius.Aliquam at, voluptas facilis ipsum libero iusto nobis vero sunt eligendi eius qui quisquam aut eaque aperiam illo ab eum ea, pariatur assumenda tempore est. Tempora minima natus delectus aut.Et voluptate quidem ducimus cum officiis accusantium maxime, quibusdam neque ratione! Incidunt rerum eveniet voluptatibus. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Mamalo</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Provident quaerat, necessitatibus sed aperiam quasi quibusdam vel earum vero illum facilis quos error dolorem.Eos magnam voluptates quas expedita architecto neque, unde rem explicabo deleniti. Natus molestiae ullam et nulla exercitationem obcaecati, nostrum at non sit aperiam quos tempore quo accusamus placeat ex consequatur.Id atque quis labore error eaque. Blanditiis dolore incidunt ipsum quo aspernatur, doloremque maiores perspiciatis ex vel totam! Doloremque, perspiciatis ducimus sit iste rem quibusdam neque voluptatibus illum? Quam, consequuntur!Vero necessitatibus a obcaecati nam id ut, recusandae cupiditate non deserunt ipsam tempora soluta eius earum molestiae sapiente nobis incidunt voluptates alias impedit possimus sequi doloribus voluptatum ad illo? Aspernatur.Ut cumque adipisci blanditiis, sint tempora, et doloribus accusantium enim a nam temporibus molestias unde eos? Dolore quo dicta, ullam cum voluptates quod totam necessitatibus itaque nostrum est, pariatur autem.Consequatur quo corrupti, quasi magnam suscipit odit cumque commodi et totam. Perferendis ipsam facilis quam dolor, nesciunt doloremque tempore labore doloribus delectus repellendus nemo ipsum, molestiae dolorem, suscipit vitae quas.Asperiores quisquam, perferendis ducimus sed consequuntur molestiae ad eligendi officiis delectus, optio impedit reprehenderit velit, possimus corporis? Quis illum maxime fugiat facere ipsa corrupti sed, necessitatibus officiis quisquam et iusto!Nam rem, possimus maxime debitis eveniet dignissimos dolorum dicta repellat unde alias est voluptas vero ipsa reprehenderit, illum fuga quam dolorem harum. Qui, saepe ut nemo voluptate nam corporis dolores.Perspiciatis vel saepe perferendis ipsum aspernatur ipsam voluptates aperiam quisquam voluptas delectus repudiandae distinctio itaque, hic accusantium. Adipisci ipsam fuga non voluptatem ea possimus iusto ipsa quis praesentium distinctio! Odio?Itaque nulla neque, enim maiores cum vel, sapiente quo dicta non, beatae corrupti explicabo autem officiis dolorum perspiciatis eos repellat dolores earum. Enim reprehenderit nulla dolore deleniti dicta quia. Voluptates?Natus vel eius repudiandae ullam molestiae deserunt doloribus excepturi itaque obcaecati architecto numquam, maxime aspernatur doloremque tempore odio corporis tenetur magnam provident iste harum! Laudantium fugit aliquam mollitia sint saepe.Placeat qui, aut iure odit earum dolores ut hic saepe alias doloribus perferendis mollitia aperiam voluptates eum exercitationem nobis vero molestiae et molestias obcaecati dolorem! Tempora quos aliquid itaque vel!Dignissimos perspiciatis eligendi voluptates rerum deleniti, velit quos, reprehenderit optio quas asperiores consequuntur. Recusandae ab distinctio totam? Veritatis culpa debitis, molestias sequi eum illo reprehenderit neque omnis earum odit libero.Amet, commodi necessitatibus nemo dolorum aliquid iusto delectus impedit consequuntur mollitia animi eaque, voluptatem, aut magni inventore? Quis amet numquam harum iste sit nemo assumenda, adipisci, eligendi sequi distinctio provident.Nisi ab alias doloremque nemo, possimus debitis dicta aliquid suscipit, accusamus labore impedit adipisci perferendis. Cupiditate perspiciatis quia pariatur incidunt adipisci dolores ad. Soluta id nobis consectetur expedita ducimus provident?Officiis, qui aperiam ipsa explicabo distinctio architecto facilis, quod, sunt at eaque quae asperiores tempore tenetur doloribus illo hic delectus fugit sed aliquam totam error dolore dicta in incidunt? Veritatis.Laborum, voluptate quas eaque enim minima quia officia, commodi quisquam sunt atque, deleniti est. Nihil officia doloremque, nesciunt quidem soluta asperiores ipsa incidunt nemo fugiat ex, ea minus, fuga magnam.Corporis ipsam blanditiis optio rerum? Labore blanditiis eligendi architecto, dolor dicta eaque perferendis maiores illo consectetur nam reprehenderit voluptatum, et nesciunt, culpa a in unde optio omnis. Delectus, rem quas!Sunt quod minima laboriosam ducimus. Suscipit sequi nesciunt velit commodi corporis tempore dolorem adipisci, quae, eum voluptatibus quas reprehenderit cum doloremque numquam veritatis et modi impedit rerum nulla aspernatur perferendis?Nostrum perferendis totam expedita minus vel possimus, quam accusantium, impedit in ratione dolores! Rem veniam laborum odio non facere ipsam necessitatibus et quae. Alias rerum neque eveniet suscipit voluptatibus quaerat.Recusandae cum laborum, eum, distinctio dolore quod minima nulla sit quaerat sunt sed sapiente nostrum exercitationem veniam, quo amet ipsa. Dolorum accusamus mollitia explicabo veritatis cumque cum quod porro veniam.Cumque neque architecto magni dolorum! Neque quia possimus veritatis quidem beatae eligendi voluptate! Facilis reprehenderit id error eum pariatur quas voluptates necessitatibus quam dolorum, itaque optio officiis accusamus quo odit.Maxime nihil aliquid voluptatem tempora obcaecati, laborum adipisci minima quasi esse ipsa vitae modi, quaerat non, est magni ea officiis sapiente nostrum sunt ducimus debitis cupiditate porro? Magnam, nobis. Dolores.Optio illo accusamus sint consequatur expedita deserunt blanditiis, possimus inventore? Cumque, ullam alias ipsa quae sapiente magni itaque id ex, repellendus dolorem asperiores expedita eligendi quibusdam! Molestias non quod accusantium.Neque fuga nulla rerum vitae quibusdam tempora voluptates eligendi, error deserunt culpa delectus magnam rem recusandae cumque provident at vel libero non illum quas? Sequi at eveniet placeat corrupti atque?Dolore minima, suscipit enim, architecto officia exercitationem quasi quidem dolorem repudiandae iusto delectus perspiciatis rem molestias neque assumenda! Quas, ipsum nesciunt? Accusamus amet eligendi voluptas ipsum perferendis deserunt incidunt ipsam.Aut facilis sapiente nostrum explicabo voluptatem a? Nobis facilis quae nisi excepturi quis neque, deleniti enim magni aut ipsam magnam aliquam deserunt consectetur asperiores ratione corrupti itaque in totam quasi!Tempore numquam consequuntur ex voluptas aut dignissimos autem minus iure, ratione officia asperiores veritatis explicabo illo suscipit perspiciatis cumque necessitatibus accusantium dolorum mollitia obcaecati a laudantium soluta ab doloribus. Quasi.Porro, quos? Maiores blanditiis, incidunt itaque tenetur officiis quasi numquam, accusamus mollitia possimus doloribus nesciunt odit exercitationem ab. Quam cupiditate placeat quis velit laborum quisquam aliquam tenetur ducimus dolor sequi!Officiis officia natus quibusdam, porro nostrum eveniet incidunt totam qui cupiditate explicabo temporibus quos, nesciunt exercitationem asperiores accusamus odit dignissimos quod optio cum ratione. Fuga obcaecati maiores eligendi voluptas inventore.Nesciunt quas nihil non cupiditate dolores? Neque rem, nam similique, dolore quibusdam voluptatibus consequatur rerum ipsa odio enim quam quia at aliquid consequuntur error ad officia, est eos possimus eum.Distinctio nulla blanditiis fuga culpa esse, maxime ad placeat adipisci quis id, neque rerum facere quae rem. Necessitatibus exercitationem earum molestiae, a cupiditate temporibus! Neque natus quod alias ratione laboriosam.Tempore vero minima tenetur officia itaque soluta, iste sunt eveniet possimus sequi labore laudantium maiores omnis ullam placeat aspernatur numquam? Corrupti voluptate possimus magnam adipisci! Non, dolor. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Vuelvelo a mamar</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Eveniet, veniam quo!Delectus possimus nemo quam modi corrupti ipsum dolor perspiciatis. Voluptatum, ducimus quidem, molestias ea aliquid sed consectetur eos maiores soluta id ipsam consequatur, vel qui aspernatur maxime deserunt harum delectus.Quibusdam illum nostrum exercitationem porro accusantium, impedit placeat facere perspiciatis magnam tempore. Doloremque, blanditiis rerum, aliquid beatae repellat necessitatibus molestiae iusto maxime voluptas doloribus tempora accusamus ipsam expedita odio impedit.Vitae facilis pariatur velit veniam? Sapiente, voluptatibus. Veniam doloribus perspiciatis dolore odio? Dolor nostrum modi, officia alias repellendus corporis consectetur repellat sapiente architecto inventore quod praesentium in voluptates eveniet labore.Mollitia, necessitatibus, id modi nemo ducimus reiciendis eligendi corrupti laboriosam adipisci eveniet similique ipsam error quibusdam esse blanditiis eum quod dolor a temporibus? Labore animi enim amet sapiente illo aliquam!Vitae iure cupiditate dolor molestiae sequi sint molestias, rerum deserunt quae ex quas explicabo omnis quidem aut distinctio tempore reiciendis eligendi illo aspernatur facere officia veritatis neque voluptates perferendis. Dolorem.Deleniti ipsam iure fugit esse eius nihil non magnam! Soluta quas, optio, ad corrupti voluptates amet tempora incidunt quam sint, repellat odio sit molestias veritatis suscipit aut! Porro, magni ipsum.Iste deserunt perferendis velit assumenda inventore. Quae eius culpa, deleniti veritatis maxime dolor reiciendis repudiandae delectus porro harum quos unde ipsa cupiditate omnis aliquam voluptatibus, vitae magni eum. Ducimus, asperiores?Enim iusto nobis repellat reiciendis praesentium quisquam quidem voluptatum est beatae soluta numquam quo exercitationem voluptate, dolore in obcaecati distinctio repellendus dolor blanditiis sunt. Dignissimos molestias consequatur consequuntur quibusdam magnam.Dolores, deleniti velit placeat officiis ut voluptatibus quasi quod nihil delectus ullam exercitationem eaque molestias saepe inventore impedit nobis, illo voluptate. Ipsam explicabo quaerat magni minus vel assumenda mollitia! Qui?Atque quo quas similique quasi itaque corporis animi natus quaerat quam sit ipsam nihil, molestiae cupiditate rerum mollitia ad, hic dolor autem perspiciatis. Voluptatum, sequi aut magni fuga vero nam.Nemo harum aspernatur perferendis veniam sunt ipsum, explicabo, animi praesentium quaerat vero sint quo obcaecati modi quia adipisci maiores, esse a nam. Nemo ratione totam explicabo nobis ut, voluptatum magni!Modi, fugit delectus maxime officiis ipsa quas corrupti illo magni consequuntur? Officia totam quasi sunt necessitatibus omnis ducimus libero autem, illo eligendi est fuga tempore aut ut quos officiis ullam.Molestias doloremque aspernatur obcaecati veritatis voluptatem? Sunt totam facilis necessitatibus doloremque aspernatur consequuntur quam? Necessitatibus assumenda, recusandae distinctio inventore aperiam blanditiis voluptates velit voluptatibus quaerat quis sed mollitia, eveniet voluptas.</p>\n<!-- /wp:paragraph -->', 'Prueba', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2019-06-06 15:59:07', '2019-06-06 18:59:07', '', 16, 'http://172.17.0.2/ayudando/wordpress/index.php/2019/06/06/16-revision-v1/', 0, 'revision', '', 0),
(22, 1, '2019-06-24 10:31:35', '2019-06-24 13:31:35', '', 'Blog', '', 'trash', 'closed', 'closed', '', '__trashed', '', '', '2019-06-24 10:31:35', '2019-06-24 13:31:35', '', 0, 'http://172.17.0.2/ayudando/wordpress/?page_id=22', 0, 'page', '', 0),
(23, 1, '2019-06-24 10:31:37', '2019-06-24 13:31:37', '', 'Blog', '', 'trash', 'closed', 'closed', '', '__trashed-2', '', '', '2019-06-24 10:31:37', '2019-06-24 13:31:37', '', 0, 'http://172.17.0.2/ayudando/wordpress/?page_id=23', 0, 'page', '', 0),
(24, 1, '2019-06-24 10:31:35', '2019-06-24 13:31:35', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2019-06-24 10:31:35', '2019-06-24 13:31:35', '', 22, 'http://172.17.0.2/ayudando/wordpress/22-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2019-06-24 10:31:37', '2019-06-24 13:31:37', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2019-06-24 10:31:37', '2019-06-24 13:31:37', '', 23, 'http://172.17.0.2/ayudando/wordpress/23-revision-v1/', 0, 'revision', '', 0),
(32, 1, '2019-06-26 16:42:44', '2019-06-26 19:42:44', '', 'Blog', '', 'publish', 'open', 'closed', '', 'blog', '', '', '2019-07-02 10:19:44', '2019-07-02 13:19:44', '', 0, 'http://172.17.0.2/ayudando/wordpress/?page_id=32', 0, 'page', '', 2),
(33, 1, '2019-06-26 16:29:59', '2019-06-26 19:29:59', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '32-revision-v1', '', '', '2019-06-26 16:29:59', '2019-06-26 19:29:59', '', 32, 'http://172.17.0.2/ayudando/wordpress/32-revision-v1/', 0, 'revision', '', 0),
(34, 1, '2019-06-26 17:19:41', '2019-06-26 20:19:41', '<div class=\"container\">\n<div class=\"row\">\n<div class=\"col-lg-12 col-sm-12\">\n\n<hr class=\"section-heading-spacer\">\n\n<div class=\"clearfix\"></div>\n<h2 class=\"section-heading\">Participamos en el proyecto:</h2>\n<ul>\n 	<li>\n<p class=\"lead\">Laurys</p>\n</li>\n 	<li>\n<p class=\"lead\">Zaraid</p>\n</li>\n 	<li>\n<p class=\"lead\">Daniel</p>\n</li>\n 	<li>\n<p class=\"lead\">Milagros</p>\n</li>\n 	<li>\n<p class=\"lead\">Mauricio</p>\n</li>\n 	<li>\n<p class=\"lead\">Astrid</p>\n</li>\n 	<li>\n<p class=\"lead\">Yindriska</p>\n</li>\n</ul>\n<h3 class=\"section-heading\">Para comunicarte con nosotros lo puedes hacer por el correo: ayudanosayudarba@gmail.com</h3>\n</div>\n</div>\n</div>\n<!-- /.container -->', 'Contacto', '', 'inherit', 'closed', 'closed', '', '8-autosave-v1', '', '', '2019-06-26 17:19:41', '2019-06-26 20:19:41', '', 8, 'http://172.17.0.2/ayudando/wordpress/8-autosave-v1/', 0, 'revision', '', 0),
(38, 1, '2019-07-01 11:46:47', '2019-07-01 14:46:47', '{\n    \"old_sidebars_widgets_data\": {\n        \"value\": {\n            \"wp_inactive_widgets\": [\n                \"search-2\",\n                \"recent-posts-2\",\n                \"recent-comments-2\",\n                \"archives-2\",\n                \"categories-2\",\n                \"meta-2\"\n            ]\n        },\n        \"type\": \"global_variable\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2019-07-01 14:46:47\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '1ad2852b-ef28-49ef-b803-c7abda7aa8f7', '', '', '2019-07-01 11:46:47', '2019-07-01 14:46:47', '', 0, 'http://172.17.0.2/ayudando/wordpress/1ad2852b-ef28-49ef-b803-c7abda7aa8f7/', 0, 'customize_changeset', '', 0),
(45, 1, '2019-07-02 12:49:15', '2019-07-02 15:49:15', 'Hola baby.\n\nEsta es una entrada de prueba bulde lo chevere.\n\nAhora un chin de lorem ipsum.\n\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam assumenda cupiditate doloremque eligendi, fuga laudantium, minima nostrum pariatur provident quae quas quibusdam repellat repellendus sequi similique velit veniam voluptatem. Quas?\n\n<img class=\"alignnone  wp-image-46\" src=\"http://172.17.0.2/ayudando/wordpress/wp-content/uploads/2019/07/descarga-1-300x150.jpeg\" alt=\"\" width=\"270\" height=\"135\" />', 'Entrada de prueba', '', 'publish', 'open', 'open', '', 'entrada-de-prueba', '', '', '2019-07-02 12:49:15', '2019-07-02 15:49:15', '', 0, 'http://172.17.0.2/ayudando/wordpress/?p=45', 0, 'post', '', 0),
(46, 1, '2019-07-02 12:49:01', '2019-07-02 15:49:01', '', 'descarga (1)', '', 'inherit', 'open', 'closed', '', 'descarga-1', '', '', '2019-07-02 12:49:01', '2019-07-02 15:49:01', '', 45, 'http://172.17.0.2/ayudando/wordpress/wp-content/uploads/2019/07/descarga-1.jpeg', 0, 'attachment', 'image/jpeg', 0),
(47, 1, '2019-07-02 12:49:15', '2019-07-02 15:49:15', 'Hola baby.\n\nEsta es una entrada de prueba bulde lo chevere.\n\nAhora un chin de lorem ipsum.\n\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam assumenda cupiditate doloremque eligendi, fuga laudantium, minima nostrum pariatur provident quae quas quibusdam repellat repellendus sequi similique velit veniam voluptatem. Quas?\n\n<img class=\"alignnone  wp-image-46\" src=\"http://172.17.0.2/ayudando/wordpress/wp-content/uploads/2019/07/descarga-1-300x150.jpeg\" alt=\"\" width=\"270\" height=\"135\" />', 'Entrada de prueba', '', 'inherit', 'closed', 'closed', '', '45-revision-v1', '', '', '2019-07-02 12:49:15', '2019-07-02 15:49:15', '', 45, 'http://172.17.0.2/ayudando/wordpress/45-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Sin categoría', 'sin-categoria', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(16, 1, 0),
(45, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'daniel'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '37'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:10:\"172.17.0.0\";}'),
(20, 1, 'session_tokens', 'a:4:{s:64:\"465378e42a771df73b96f02dfe8cafcb5e25c9214981b1b651840800b1c86430\";a:4:{s:10:\"expiration\";i:1563220425;s:2:\"ip\";s:10:\"172.17.0.1\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36\";s:5:\"login\";i:1562010825;}s:64:\"1daadaa362d64882f69ca84b3e9bab1d55b8b514c368c638050392cb565f24e0\";a:4:{s:10:\"expiration\";i:1563220582;s:2:\"ip\";s:10:\"172.17.0.1\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36\";s:5:\"login\";i:1562010982;}s:64:\"11cde093e994456f9afbeae5486d49257f903c18a4dc469a2bc94f0d53a1bff0\";a:4:{s:10:\"expiration\";i:1563221707;s:2:\"ip\";s:10:\"172.17.0.1\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36\";s:5:\"login\";i:1562012107;}s:64:\"181e2ef2d42ee01290ac4f2f74da7d8502841adbdbcd9671fdf5932b160ef676\";a:4:{s:10:\"expiration\";i:1563975586;s:2:\"ip\";s:10:\"172.17.0.1\";s:2:\"ua\";s:105:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36\";s:5:\"login\";i:1562765986;}}'),
(21, 1, 'wp_user-settings', 'libraryContent=browse'),
(22, 1, 'wp_user-settings-time', '1559844288'),
(23, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(24, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:19:\"add-post-type-libro\";i:1;s:12:\"add-post_tag\";i:2;s:15:\"add-post_format\";}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'daniel', '$P$B3LM3Bgc3M09JbX9RTUdCOQ2ZsnZ18.', 'daniel', 'dedd712@gmail.com', '', '2019-06-03 17:40:57', '', 0, 'daniel');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indices de la tabla `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indices de la tabla `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indices de la tabla `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indices de la tabla `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indices de la tabla `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indices de la tabla `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indices de la tabla `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;
--
-- AUTO_INCREMENT de la tabla `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT de la tabla `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
