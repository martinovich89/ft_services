<?php

define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'mhenry' );
define( 'DB_PASSWORD', 'pw' );
define( 'DB_HOST', 'mysql-service' );

define( 'DB_CHARSET', 'utf8mb4' );

define( 'DB_COLLATE', '' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) )
{
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
