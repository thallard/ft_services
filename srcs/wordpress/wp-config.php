<?php

define( 'DB_NAME',     'wordpress' );
define( 'DB_USER',     'root' );
define( 'DB_PASSWORD', 'root' );
define( 'DB_HOST',     'mysql-service' );
define( 'DB_CHARSET',  'utf8' );


define( 'AUTH_KEY',         '4324324234234' );
define( 'SECURE_AUTH_KEY',  '23423423432423' );
define( 'LOGGED_IN_KEY',    '234234234wefwegrgrogrgrtijrijghrtjkne' );
define( 'NONCE_KEY',        'fjjnfhigrehegrhiugrehiugrhiughiughiu' );
define( 'AUTH_SALT',        'efhiufehiueghuhdehijdwfjsdjfjadsaf' );
define( 'SECURE_AUTH_SALT', 'efjiewifwjfjewjdqwjdwjefjvjnjnfvjn' );
define( 'LOGGED_IN_SALT',   'ijewioewoopwjkfwjdncnjwdqfieiqwjfeqwfwqe' );
define( 'NONCE_SALT',       'efwioefiowijefwijfewijfeweweiowioerowerweior' );

$table_prefix = 'wp_';


/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( ! defined( 'ABSPATH' ) )
  define( 'ABSPATH', dirname( __FILE__ ) . '/' );

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once( ABSPATH . 'wp-settings.php' );