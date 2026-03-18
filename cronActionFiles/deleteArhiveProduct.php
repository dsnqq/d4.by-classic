<?php
require_once('/home/dby/sites/d4.by/config.php');

$link = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE)
or die("Ошибка подключения: " . mysqli_connect_error());

function is_image_used_in_active_products($link, $image_path) {
    $tables = ['oc_product', 'oc_product_image'];
    foreach ($tables as $table) {
        $query = "SELECT COUNT(*) as count FROM $table WHERE image = ?";
        $stmt = mysqli_prepare($link, $query);
        mysqli_stmt_bind_param($stmt, "s", $image_path);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        $row = mysqli_fetch_assoc($result);
        mysqli_stmt_close($stmt);

        if ($row['count'] > 0) {
            return true;
        }
    }
    return false;
}

function log_deleted_image($path) {
    $logPath = '/home/dby/sites/d4.by/cronActionFiles/logs/deleteArhiveProduct.log';
    $date = date('Y-m-d H:i:s');
    file_put_contents($logPath, "[$date] Deleted: $path\n", FILE_APPEND);
}

function delete_image($link, $path) {
    if (!$path) return;

    $fullPath = rtrim(DIR_IMAGE . $path, '/');

    if ($fullPath === rtrim(DIR_IMAGE . 'catalog/', '/')) return;

    if (file_exists($fullPath) && is_file($fullPath)) {
        if (!is_image_used_in_active_products($link, $path)) {
            unlink($fullPath);
            log_deleted_image($path);
        }
    }
}

function delete_product_data($link, $product_id) {
    $tables = [
        'oc_arhive_attribute',
        'oc_arhive_description',
        'oc_arhive_image',
        'oc_arhive_to_category',
        'oc_arhive_to_layout',
        'oc_arhive_to_store',
        'oc_arhive'
    ];

    foreach ($tables as $table) {
        $query = "DELETE FROM `$table` WHERE product_id = ?";
        $stmt = mysqli_prepare($link, $query);
        mysqli_stmt_bind_param($stmt, "i", $product_id);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_close($stmt);
    }
}

// Получаем список архивных товаров
$query = "SELECT * FROM oc_arhive";
$result = mysqli_query($link, $query) or die("Ошибка запроса: " . mysqli_error($link));

while ($item = mysqli_fetch_assoc($result)) {
    $product_id = (int)$item['product_id'];
    $date_delete = $item['date_delete'];

    $deleteDay = 0;
    if ($date_delete) {
        $deleteDay = floor((time() - strtotime($date_delete)) / (60 * 60 * 24));
    }

    // Если прошло 30+ дней или дата удаления пустая — удаляем фото
    if (!$date_delete || $deleteDay >= 30) {

        // Основное фото
        delete_image($link, $item['image']);

        // Дополнительные фото
        $images_query = "SELECT image FROM oc_arhive_image WHERE product_id = $product_id";
        $images_result = mysqli_query($link, $images_query);
        while ($img = mysqli_fetch_assoc($images_result)) {
            delete_image($link, $img['image']);
        }

        // Если прошло 180+ дней — удаляем из всех таблиц
        if ($deleteDay >= 180) {
            delete_product_data($link, $product_id);
        }
    }
}

mysqli_close($link);