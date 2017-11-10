<?php

/*
$array[] = array(
"sku"=>"065\/SF 039\/V2",
"quantity"=>"15",
"quantity_production"=>"10",
"price"=>"3490"
);
$array[] = array(
"sku"=>"1003\/Shoes-fur\/S090\/B",
"quantity"=>"28",
"quantity_production"=>"10",
"price"=>"3190",
"size"=>array(
    "36" => "15",
    "37" => "13"
)
);
echo json_encode($array);
die();*/

// Version
define('VERSION', '2.2.0.0');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

// Install
if (!defined('DIR_APPLICATION')) {
	header('Location: install/index.php');
	exit;
}

// VirtualQMOD
require_once('./vqmod/vqmod.php');
VQMod::bootup();

// VQMODDED Startup
require_once(VQMod::modCheck(DIR_SYSTEM . 'startup.php'));

$application_config = 'catalog';

// Application
require_once(VQMod::modCheck(DIR_SYSTEM . 'framework.php'));

