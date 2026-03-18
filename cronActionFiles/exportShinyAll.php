<?php
require_once('/home/dby/sites/d4.by/config.php');

// === Утилита: подключение к БД ===
function db_connect() {
    $link = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
    if (!$link) {
        die("Ошибка подключения: " . mysqli_connect_error());
    }
    return $link;
}

// === Функция генерации CSV ===
function kama_create_csv_file($data, $filepath, $col_delim = ';', $row_delim = "\r\n") {
    if (!is_array($data) || empty($data)) return false;
    $dir = dirname($filepath);
    if (!is_dir($dir)) mkdir($dir, 0777, true);

    $fp = fopen($filepath, 'w');
    if (!$fp) die("Не удалось открыть файл для записи: $filepath");

    foreach ($data as $row) {
        $out = [];
        foreach ($row as $cell) {
            $v = (string)$cell;
            if (preg_match('/[";,\r\n]/', $v)) {
                $v = str_replace(["\r\n","\n","\r"], ['\n','\r',''], $v);
                $v = str_replace('"', '""', $v);
            }
            $out[] = '"' . $v . '"';
        }
        fwrite($fp, implode($col_delim, $out) . $row_delim);
    }
    fclose($fp);
    return true;
}

// === Основная функция экспорта шин для bamper.by ===
function export_tires_for_bamper() {
    $link = db_connect();

    // Один комплексный запрос с агрегацией изображений и контактов
    $sql = "SELECT s.product_id, s.model, s.ean, s.upc, s.jan, s.isbn,
                   s.mpn, s.sku, s.location, s.quantity, s.length,
                   s.version, s.price, sd.description,
                   GROUP_CONCAT(DISTINCT si.image SEPARATOR ',') AS images,
                   MAX(CASE WHEN sa.attribute_id = 13 THEN sa.text END) AS tel,
                   MAX(CASE WHEN sa.attribute_id = 17 THEN sa.text END) AS city
            FROM oc_shiny s
            LEFT JOIN oc_shiny_description sd ON s.product_id = sd.product_id
            LEFT JOIN oc_shiny_image si ON s.product_id = si.product_id
            LEFT JOIN oc_shiny_attribute sa ON s.product_id = sa.product_id
            WHERE s.status != '0'
            GROUP BY s.product_id";
    $res = mysqli_query($link, $sql);
    if (!$res) {
        die("Ошибка выполнения запроса: " . mysqli_error($link));
    }

    $headers = [
        'ID_EXT','МАРКА','МОДЕЛЬ','ШИРИНА','ВЫСОТА','ДИАМЕТР','СЕЗОН','СОСТОЯНИЕ',
        'КОЛИЧЕСТВО','ГОД','ТИП ШИН','ЦЕНА','ВАЛЮТА','КОММЕНТАРИЙ',
        'ТЕЛЕФОН','EMAIL','ИМЯ','АДРЕС','ФОТО'
    ];
    $data = [$headers];

    while ($t = mysqli_fetch_assoc($res)) {
        // Обработка изображений
        $imgs = $t['images'] ? explode(',', $t['images']) : [];
        $images = '';
        if (!empty($imgs)) {
            // Добавляем префикс и объединяем обратно
            $prefixed = array_map(
                function($img) {
                    return HTTPS_SERVER . 'image/' . $img;
                },
                $imgs
            );
            $images = implode(',', $prefixed);
        }

        $comment = strip_tags(str_replace("\n", ' ', $t['description'] ?? ''));

        $data[] = [
            $t['model'],
            $t['ean'],
            $t['upc'],
            $t['jan'],
            $t['isbn'],
            $t['mpn'],
            $t['sku'],
            $t['location'],
            $t['quantity'],
            $t['length'],
            $t['version'],
            $t['price'],
            'USD',
            $comment,
            $t['tel'] ?? '',
            'info@d4.by',
            '',
            $t['city'] ?? '',
            $images
        ];
    }
    
    mysqli_free_result($res);
    mysqli_close($link);

    $file = '/home/dby/sites/d4.by/bamper/csv_for_bamper_shiny.csv';
    if (kama_create_csv_file($data, $file)) {
        echo "Экспорт шин завершён: $file\n";
    }
}

// Запуск экспорта
export_tires_for_bamper();