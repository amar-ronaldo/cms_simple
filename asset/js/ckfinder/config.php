<?php

require_once __DIR__.'../../../../application/config/kcfinder.php';

/*==================================== Plugins ========================================*/
// https://ckeditor.com/docs/ckfinder/ckfinder3-php/configuration.html#configuration_options_plugins

$config['pluginsDirectory'] = __DIR__ . '/plugins';
$config['plugins'] = array();

// Config must be returned - do not change it.
return $config;
