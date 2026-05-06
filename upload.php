<?php
/**
 * Загрузка фото для админки (Dropzone). Файлы должны попадать в DIR_IMAGE (см. config.php),
 * иначе витрина не найдёт их: catalog/model/tool/image.php проверяет is_file(DIR_IMAGE . $filename).
 * Раньше использовались относительные пути — при CWD не корне сайта файлы не сохранялись в image/.
 */
set_time_limit(0);

header('Content-Type: text/plain; charset=utf-8');

$base = __DIR__;
$date_now = date('d.m.Y');
$time = (int) strtotime($date_now);
$subdir = 'image/catalog/d4_img/' . $time;
$dir = $base . '/' . $subdir;

if (!is_dir($dir)) {
	if (!@mkdir($dir, 0777, true)) {
		http_response_code(500);
		echo 'mkdir_failed';
		exit;
	}
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST' || empty($_FILES['file']) || !isset($_FILES['file']['tmp_name'])) {
	http_response_code(400);
	echo 'no_file';
	exit;
}

if (!is_uploaded_file($_FILES['file']['tmp_name'])) {
	http_response_code(400);
	echo 'invalid_upload';
	exit;
}

$name = basename($_FILES['file']['name']);
if ($name === '' || $name === '.' || $name === '..') {
	http_response_code(400);
	echo 'bad_name';
	exit;
}

$dest = $dir . '/' . $name;
if (!move_uploaded_file($_FILES['file']['tmp_name'], $dest)) {
	http_response_code(500);
	echo 'move_failed';
	exit;
}

@chmod($dest, 0664);
http_response_code(200);
echo 'OK';
