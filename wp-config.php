<?php 

define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', 'wordpress');
define('DB_HOST', 'db');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');



define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', false);



$table_prefix = 'wp_';

// define('WP_MAIL_SMTP', 'mailhog:1025');
define('WP_HOME', 'http://localhost:8000');
define('WP_SITEURL', 'http://localhost:8000');

// define('WP_HOME', 'http://wordpress');
// define('WP_SITEURL', 'http://wordpress');

define('FS_METHOD', 'direct');



if ( !defined('ABSPATH') )
  define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');