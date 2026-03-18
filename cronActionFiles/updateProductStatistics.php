<?php
$DIR = '/home/dby/sites/d4.by/';
require_once('/home/dby/sites/d4.by/config.php');

$link = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE)
or die("Ошибка подключения: " . mysqli_connect_error());

$file = DIR_SYSTEM . 'product_views.log';
if (!file_exists($file)) exit;

$lines = file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

foreach ($lines as $line) {
    $view = json_decode($line, true);
    if (!$view) continue;

    $product_id = (int)$view['product_id'];
    $nameStatic = mysqli_real_escape_string($link, $view['nameStatic']);
    $timestamp = mysqli_real_escape_string($link, $view['timestamp']);

    // Проверяем, есть ли уже запись в таблице
    $check_query = "SELECT view_count, view_date_list FROM `" . DB_PREFIX . "product_statistics` WHERE product_id = $product_id";
    $check_result = mysqli_query($link, $check_query) or die("Ошибка " . mysqli_error($link));

    if (mysqli_num_rows($check_result) > 0) {
        $row = mysqli_fetch_assoc($check_result);

        // Добавляем новую дату к существующим
        $existing_dates = array_filter(explode(',', $row['view_date_list']));
        $existing_dates[] = $timestamp;

        // Опционально: сохраняем только последние 1000 дат
        $existing_dates = array_slice($existing_dates, -1000);

        $view_date_list = implode(',', $existing_dates);

        // Обновляем запись
        $update_query = "
            UPDATE `" . DB_PREFIX . "product_statistics` SET 
                view_count = view_count + 1,
                view_date_list = '$view_date_list',
                nameStatic = '$nameStatic'
            WHERE product_id = $product_id
        ";
        mysqli_query($link, $update_query) or die("Ошибка " . mysqli_error($link));
    } else {
        // Вставляем новую запись
        $insert_query = "
            INSERT INTO `" . DB_PREFIX . "product_statistics` 
                (product_id, view_count, view_date_list, nameStatic) 
            VALUES ($product_id, 1, '$timestamp', '$nameStatic')
        ";
        mysqli_query($link, $insert_query) or die("Ошибка " . mysqli_error($link));
    }
}

// Очищаем файл после обработки
file_put_contents($file, '');

// Закрываем соединение
mysqli_close($link);