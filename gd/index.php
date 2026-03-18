<?php
    // Установка заголовков и подключение CSS
    header('Content-Type: text/html; charset=utf-8');
    echo '<link href="/catalog/view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet">';

    // Подключение конфигурации и инициализация базы данных
    require_once "/home/dby/sites/d4.by/config.php";
    $link = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE)
    or die("Ошибка подключения к базе данных: " . mysqli_error($link));

    // Валидация и обработка product_id
    $product_id = isset($_GET['product_id']) ? (int)preg_replace('/\D+/', '', trim($_GET['product_id'])) : 0;
    if ($product_id <= 0) {
        header("Location: https://d4.by");
        exit();
    }

    // Запрос для получения основной информации о товаре
    $query = "SELECT 
                p.*, 
                pd.name, pd.description,
                m.name AS manufacturer_name,
                cd.name AS model_name,
                cp.parent_id AS brand_id,
                ccd.name AS brand_name,
                rub.value AS rub_value,
                byn.value AS byn_value
              FROM oc_product p
              LEFT JOIN oc_product_description pd ON p.product_id = pd.product_id
              LEFT JOIN oc_manufacturer m ON p.manufacturer_id = m.manufacturer_id
              LEFT JOIN oc_product_to_category ptc ON p.product_id = ptc.product_id
              LEFT JOIN oc_category_description cd ON ptc.category_id = cd.category_id
              LEFT JOIN oc_category cp ON ptc.category_id = cp.category_id
              LEFT JOIN oc_category_description ccd ON cp.parent_id = ccd.category_id
              LEFT JOIN (SELECT value FROM oc_currency WHERE code = 'RUB') rub ON 1=1
              LEFT JOIN (SELECT value FROM oc_currency WHERE code = 'BYN') byn ON 1=1
              WHERE p.product_id = $product_id";

    $result = mysqli_query($link, $query) or die("Ошибка запроса данных товара: " . mysqli_error($link));

    if (mysqli_num_rows($result) == 0) {
        die("Товар не найден");
    }

    $product = mysqli_fetch_assoc($result);

    // 2. Запрос для получения атрибутов товара
    $attributes = ['tel' => '', 'sklad' => '', 'city_s' => ''];
    $query = "SELECT attribute_id, text FROM oc_product_attribute WHERE product_id = $product_id AND attribute_id IN (12, 13, 17)";
    $result = mysqli_query($link, $query);
    while ($row = mysqli_fetch_assoc($result)) {
        if ($row['attribute_id'] == 13) $attributes['tel'] = $row['text'];
        elseif ($row['attribute_id'] == 12) $attributes['sklad'] = $row['text'];
        elseif ($row['attribute_id'] == 17) $attributes['city_s'] = $row['text'];
    }

    // Подготовка данных для вывода
    $status = $product['status'] == 1 ? "Активно" : "Неактивно";
    $colorStatus = $product['status'] == 1 ? "green" : "red";
    $description = str_replace(["\n", "\r"], ' ', strip_tags($product['description']));

    // Формирование заголовка
    $h1 = $product['manufacturer_name'] . " к " . $product['brand_name'] . " " . $product['model_name'] . ", " . $product['length'] . "г.";
    $date_added = substr($product['date_added'], 0, -9);

    // Формирование информации о дисках
    $disk_info = $product['location'];
    if (!empty($product['width'])) $disk_info .= "; " . $product['width'] . "j; ";
    if (!empty($product['height'])) $disk_info .= $product['height'] . "-";
    if (!empty($product['weight'])) $disk_info .= $product['weight'] . "; ";
    if (!empty($product['etvylet'])) $disk_info .= "ET-" . $product['etvylet'] . "; ";
    if (!empty($product['diadiametr'])) $disk_info .= "DIA-" . $product['diadiametr'];
    $disk_info = !empty($disk_info) ? '<br>' . $disk_info . '<br>' : '';

    // Формирование дополнительной информации
    $additional_info = '';
    if (!empty($product['upc'])) $additional_info .= '<strong>Коробка: </strong>' . $product['upc'] . '<br>';
    if (!empty($product['ean'])) $additional_info .= '<strong>Тип кузова: </strong>' . $product['ean'] . '<br>';

    // Расчет цен
    $price_RUB = round((float)$product['price'] * $product['rub_value'], 0);
    $price_BYN = round((float)$product['price'] * $product['byn_value'], 2);
?>

<style>
    table {
        width: 100%;
        border-spacing: unset;
        border-collapse: collapse;
        max-width: 500px;
        margin: 0 auto;
    }
    table td {
        border: 1px solid black;
        font-size: 14px;
    }
    table tr:first-child td {
        font-weight: bold;
        font-size: 16px;
    }
    table tr:not(:first-child) td {
        font-size: 16px;
        font-weight: bold;
    }
    .head_table {
        background: #1C7ED6;
        color: #fff;
        text-align: center;
    }
</style>

<table class="table table-bordered table-inverse" style="max-width: 500px;margin: 0 auto;">
    <tr>
        <td class="head_table">Фото</td>
        <td><img src="/image/<?= $product['image'] ?>" width="250px"></td>
    </tr>
    <tr>
        <td class="head_table">Артикул</td>
        <td><?= $product['model'] ?></td>
    </tr>
    <tr>
        <td class="head_table">Название</td>
        <td><?= $h1 . $disk_info ?></td>
    </tr>
    <tr>
        <td class="head_table">Объем</td>
        <td><?= $product['jan'] ?></td>
    </tr>
    <tr>
        <td class="head_table">Тип топлива</td>
        <td><?= $product['isbn'] ?></td>
    </tr>
    <tr>
        <td class="head_table">Номер З/Ч</td>
        <td><?= $product['sku'] ?></td>
    </tr>
    <tr>
        <td class="head_table">Дата создания</td>
        <td><?= $date_added ?></td>
    </tr>
    <tr>
        <td class="head_table">Описание + Инфо</td>
        <td style="width: 250px;"><?= $description ?><br><br><?= $additional_info ?></td>
    </tr>
    <?php if (!empty($attributes['sklad'])): ?>
        <tr>
            <td class="head_table">Заметка</td>
            <td style="color:red;"><?= $attributes['sklad'] ?></td>
        </tr>
    <?php endif; ?>
    <tr>
        <td class="head_table">Статус</td>
        <td style="color:#fff;background:<?= $colorStatus ?>;"><?= $status ?></td>
    </tr>
    <tr>
        <td class="head_table">Цена</td>
        <td style="width: 101px;">
            <?= $product['price'] ?> $<br>
            <?= $price_RUB ?> RUB<br>
            <?= $price_BYN ?> BYN
        </td>
    </tr>
</table>