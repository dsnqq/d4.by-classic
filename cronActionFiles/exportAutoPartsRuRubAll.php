<?php
$DIR = '/home/dby/sites/d4.by/';

require_once($DIR . 'cronActionFiles/functions/kamaCreateCsvFile.php');
require_once($DIR . 'config.php');

$link = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if (!$link) die("Ошибка подключения к БД: " . mysqli_connect_error());

// Загружаем курсы валют
$currency_data = [];
$resCurrency = mysqli_query($link, 'SELECT * FROM `oc_currency`');
while ($row = mysqli_fetch_assoc($resCurrency)) {
    $currency_data[$row['code']] = $row;
}

// Загружаем товары
$resProducts = mysqli_query($link, "SELECT * FROM `oc_product` WHERE status != '0'");
if (!$resProducts) die("Ошибка запроса товаров");

$create_data = [[
    'ID_EXT',
    'МАРКА',
    'МОДЕЛЬ',
    'ГОД',
    'ЗАПЧАСТЬ',
    'ВЕРСИЯ',
    'ТОПЛИВО',
    'ОБЪЕМ',
    'ТИП ДВИГАТЕЛЯ',
    'КОРОБКА',
    'ТИП КУЗОВА',
    'R ДИАМЕТР',
    'J ШИРИНА',
    'КОЛ ОТВЕРСТИЙ',
    'ET ВЫЛЕТ',
    'DIA',
    'PCD',
    'НОМЕР',
    'ОПИСАНИЕ',
    'НОВАЯ',
    'ПОД ЗАКАЗ',
    'СКЛАДСКАЯ ИНФОРМАЦИЯ',
    'ЦЕНА',
    'ВАЛЮТА',
    'СКИДКА',
    'АДРЕС',
    'ТЕЛЕФОНЫ',
    'EMAIL',
    'ИМЯ',
    'ФОТО'
]];

while ($product = mysqli_fetch_assoc($resProducts)) {
    $productId = (int)$product['product_id'];

    // Получаем доп. фото
    $images = [];
    $resImages = mysqli_query($link, "SELECT image FROM `oc_product_image` WHERE product_id = $productId ORDER BY sort_order ASC");
    while ($img = mysqli_fetch_assoc($resImages)) {
        if (!empty($img['image'])) {
            $images[] = HTTPS_SERVER . 'image/' . $img['image'];
        }
    }
    $images_str = implode(',', $images);

    // Описание
    $resDesc = mysqli_query($link, "SELECT description FROM `oc_product_description` WHERE product_id = $productId");
    $desc = mysqli_fetch_assoc($resDesc)['description'] ?? '';
    $desc = strip_tags(str_replace("\n", ' ', $desc));

    // Склад, телефон, город
    $sklad = $tel = $city_s = '';
    $resAttr = mysqli_query($link, "SELECT attribute_id, text FROM `oc_product_attribute` WHERE product_id = $productId");
    while ($attr = mysqli_fetch_assoc($resAttr)) {
        if ($attr['attribute_id'] == 12) $sklad = $attr['text'];
        elseif ($attr['attribute_id'] == 13) $tel = $attr['text'];
        elseif ($attr['attribute_id'] == 17) $city_s = $attr['text'];
    }

    // Скидка
    $discount = '';
    $resSpecial = mysqli_query($link, "SELECT price FROM `oc_product_special` WHERE product_id = $productId LIMIT 1");
    if ($special = mysqli_fetch_assoc($resSpecial)) {
        $discount = (int)(100 - ($special['price'] * 100 / $product['price']));
    }

    // Тип запчасти
    $type = '';
    $resMan = mysqli_query($link, "SELECT name FROM `oc_manufacturer` WHERE manufacturer_id = " . (int)$product['manufacturer_id']);
    if ($row = mysqli_fetch_assoc($resMan)) $type = $row['name'];

    // Категория и модель
    $resCat = mysqli_query($link, "SELECT category_id FROM `oc_product_to_category` WHERE product_id = $productId LIMIT 1");
    $cat_id = mysqli_fetch_assoc($resCat)['category_id'] ?? 0;

    $resCatDesc = mysqli_query($link, "SELECT name FROM `oc_category_description` WHERE category_id = $cat_id");
    $model = mysqli_fetch_assoc($resCatDesc)['name'] ?? '';

    $resParent = mysqli_query($link, "SELECT parent_id FROM `oc_category` WHERE category_id = $cat_id");
    $parent_id = mysqli_fetch_assoc($resParent)['parent_id'] ?? 0;

    $resMarka = mysqli_query($link, "SELECT name FROM `oc_category_description` WHERE category_id = $parent_id");
    $marka = mysqli_fetch_assoc($resMarka)['name'] ?? '';

    // Версия
    $version = '';
    $resVersion = mysqli_query($link, "SELECT filter_id FROM `oc_category_filter` WHERE category_id = $cat_id");
    while ($v = mysqli_fetch_assoc($resVersion)) {
        $resFilter = mysqli_query($link, "SELECT name FROM `oc_filter_description` WHERE filter_id = {$v['filter_id']}");
        if ($f = mysqli_fetch_assoc($resFilter)) {
            if (preg_match("/\((\d+)-(\d+)\)/", $f['name'], $m)) {
                if ($product['length'] >= $m[1] && $product['length'] <= $m[2]) {
                    $version = $f['name'];
                    break;
                }
            }
        }
    }

    $price_rub = round($product['price'] * ($currency_data['RUB']['value'] ?? 1), 2);

    $create_data[] = [
        $product['model'],
        $marka,
        $model,
        $product['length'],
        $type,
        $version,
        $product['isbn'],
        $product['jan'],
        $product['mpn'],
        $product['upc'],
        $product['ean'],
        $product['location'],
        $product['width'],
        $product['height'],
        $product['etvylet'],
        $product['diadiametr'],
        $product['weight'],
        $product['sku'],
        $desc,
        0,
        0,
        $sklad,
        $price_rub,
        'RUB',
        $discount,
        $city_s,
        $tel,
        '',
        '',
        $images_str
    ];
}

echo 'Выполнено обновление файла для заливки всех З/Ч (RUB). Дата и Время: ' . date("d.m.Y H:i:s");

// Создаем CSV
kama_create_csv_file($create_data, $DIR . 'export/csv_export_ru_rub_all.csv');

mysqli_close($link);
?>