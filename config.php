<?php
$server_document_root = $_SERVER['DOCUMENT_ROOT'];
$http_host = $_SERVER['HTTP_HOST'];

// HTTP
define('HTTP_SERVER', 'http://'.$http_host.'/');

// HTTPS
define('HTTPS_SERVER', 'https://'.$http_host.'/');

// DIR
define('DIR_APPLICATION', $server_document_root.'/catalog/');
define('DIR_SYSTEM', $server_document_root.'/system/');
define('DIR_IMAGE', $server_document_root.'/image/');
define('DIR_LANGUAGE', $server_document_root.'/catalog/language/');
define('DIR_TEMPLATE', $server_document_root.'/catalog/view/theme/');
define('DIR_CONFIG', $server_document_root.'/system/config/');
define('DIR_CACHE', $server_document_root.'/system/storage/cache/');
define('DIR_DOWNLOAD', $server_document_root.'/system/storage/download/');
define('DIR_LOGS', $server_document_root.'/system/storage/logs/');
define('DIR_MODIFICATION', $server_document_root.'/system/storage/modification/');
define('DIR_UPLOAD', $server_document_root.'/system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');
define('DB_DATABASE', 'fidelitti');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');
