<?php
/**
 * Загрузка фото для админки (Dropzone). Файлы должны попадать в DIR_IMAGE (см. config.php),
 * иначе витрина не найдёт их: catalog/model/tool/image.php проверяет is_file(DIR_IMAGE . $filename).
 * Раньше использовались относительные пути — при CWD не корне сайта файлы не сохранялись в image/.
 */
set_time_limit(0);

header('Content-Type: text/plain; charset=utf-8');

function normalizeJpegOrientation($file_path) {
	if (!function_exists('exif_read_data') || !function_exists('imagecreatefromjpeg') || !function_exists('imagejpeg') || !function_exists('imagerotate')) {
		return;
	}

	$image_info = @getimagesize($file_path);
	if (!$image_info || !isset($image_info[2]) || (int)$image_info[2] !== IMAGETYPE_JPEG) {
		return;
	}

	$exif = @exif_read_data($file_path);
	$orientation = isset($exif['Orientation']) ? (int)$exif['Orientation'] : 1;

	if ($orientation === 1) {
		return;
	}

	$image = @imagecreatefromjpeg($file_path);
	if (!$image) {
		return;
	}

	switch ($orientation) {
		case 3:
			$rotated = imagerotate($image, 180, 0);
			imagedestroy($image);
			$image = $rotated;
			break;
		case 6:
			$rotated = imagerotate($image, -90, 0);
			imagedestroy($image);
			$image = $rotated;
			break;
		case 8:
			$rotated = imagerotate($image, 90, 0);
			imagedestroy($image);
			$image = $rotated;
			break;
		default:
			// Unsupported EXIF orientation variants (mirrored).
			imagedestroy($image);
			return;
	}

	if (!$image) {
		return;
	}

	imagejpeg($image, $file_path, 92);
	imagedestroy($image);
}

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

normalizeJpegOrientation($dest);

@chmod($dest, 0664);
http_response_code(200);
echo 'OK';
