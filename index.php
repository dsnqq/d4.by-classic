<?php
// Version
define('VERSION', '2.3.0.2.3');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

// v2pagecache: try to serve from page cache early
require_once(DIR_SYSTEM . 'library/v2pagecache.php');
$pagecache = new V2PageCache();
if ($pagecache->ServeFromCache()) {
	// If we served this page from the cache, stop processing
	return;
}

// Install
if (!defined('DIR_APPLICATION')) {
	header('Location: install/index.php');
	exit;
}

// Startup (vqmod removed)
require_once(DIR_SYSTEM . 'startup.php');

start('catalog');

// v2pagecache: store generated html into cache
if ($pagecache->OkToCache()) {
	$pagecache->CachePage();
}