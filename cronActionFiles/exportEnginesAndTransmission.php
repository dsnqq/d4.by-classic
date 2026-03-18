<?php
$DIR = '/home/dby/sites/d4.by/';

require_once($DIR . 'cronActionFiles/functions/kamaCreateCsvFile.php');
require_once($DIR . 'cronActionFiles/functions/kamaCreateXlsFile.php');
require_once($DIR . 'config.php');

$link = mysqli_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE)
or die("Ошибка " . mysqli_error($link));

$query = "SELECT * FROM `oc_product` WHERE status != '0' AND manufacturer_id IN (243,457,458,2055,2054,2053,1181,2276,2051,459)";
$result = mysqli_query($link, $query) or die("Ошибка " . mysqli_error($link));

// наш массив создаем с заголовками
$create_data = array(
    array(
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
        'ФОТО',
    )
);

// Обработка всех данных для з/ч
$jel = 1;
$mas = array();
$ext_mas = array();
$my_modification = '';
while($result_item = mysqli_fetch_array($result)){

    // достаем доп.фото
    $query__images = 'SELECT * FROM `oc_product_image` WHERE product_id = ' . (int)$result_item['product_id'] . ' ORDER BY sort_order ASC' ;
    $result__images = mysqli_query($link, $query__images) or die("Ошибка " . mysqli_error($link));
    $images_product = ''; // переменная для доп.изобр.
    while($row__images = mysqli_fetch_array($result__images)){ // находим все нужные доп.изображения
        if($row__images['image'] != ""){
            $images_product .= HTTPS_SERVER.'image/'.$row__images['image'].',';
        }
    }
    $images_product = substr($images_product,0,-1); // удаляем последнюю запятую


    // достаем телефон и складскую информацию
    $tel = '';
    $sklad = '';
    $city_s = '';
    $query__attr = 'SELECT * FROM `oc_product_attribute` WHERE product_id = ' . (int)$result_item['product_id'];
    $result__attr = mysqli_query($link, $query__attr) or die("Ошибка " . mysqli_error($link));
    while (  $row__attr  =  mysqli_fetch_row($result__attr)  ){
        if($row__attr[1] == 13){
            $tel = $row__attr[3];
        } elseif($row__attr[1] == 12){
            $sklad = $row__attr[3];
        } elseif($row__attr[1] == 17){
            $city_s = $row__attr[3];
        }

    }

    // достаем описание
    $query__desc = 'SELECT * FROM `oc_product_description` WHERE product_id = ' . (int)$result_item['product_id'];
    $result__desc = mysqli_query($link, $query__desc) or die("Ошибка " . mysqli_error($link));
    $row__desc = mysqli_fetch_row($result__desc);

    // достаём скидку если есть
    $query__special = 'SELECT * FROM `oc_product_special` WHERE product_id = ' . (int)$result_item['product_id'];
    $result__special = mysqli_query($link, $query__special) or die("Ошибка " . mysqli_error($link));
    $row__special = mysqli_fetch_row($result__special);
    if($row__special[4] && $row__special[4] != ""){
        // $result_item['price']
        $special_price = 100 - ((float)$row__special[4]*100)/(float)$result_item['price'];
        $special_price = (int)$special_price;
    } else{
        $special_price = "";
    }

    //достаем тип запчасти
    $query__type = 'SELECT * FROM `oc_manufacturer` WHERE manufacturer_id = ' . (int)$result_item['manufacturer_id'];
    $result__type = mysqli_query($link, $query__type) or die("Ошибка " . mysqli_error($link));
    $row__type = mysqli_fetch_row($result__type);

    // достаем марку и модель
    $query__auto = 'SELECT * FROM `oc_product_to_category` WHERE product_id = ' . (int)$result_item['product_id'];
    $result__auto = mysqli_query($link, $query__auto) or die("Ошибка " . mysqli_error($link));
    $row__auto = mysqli_fetch_row($result__auto);

    $query__marka = 'SELECT * FROM `oc_category_description` WHERE category_id = ' . (int)$row__auto[1];
    $result__marka = mysqli_query($link, $query__marka) or die("Ошибка " . mysqli_error($link));
    $row__marka = mysqli_fetch_row($result__marka);

    // ищем категорию родитель ID
    $query__parentid = 'SELECT * FROM `oc_category` WHERE category_id = ' . (int)$row__auto[1];
    $result__parentid = mysqli_query($link, $query__parentid) or die("Ошибка " . mysqli_error($link));
    $row__parentid = mysqli_fetch_row($result__parentid);

    $query__model = 'SELECT * FROM `oc_category_description` WHERE category_id = ' . (int)$row__parentid[2];
    $result__model = mysqli_query($link, $query__model) or die("Ошибка " . mysqli_error($link));
    $row__model = mysqli_fetch_row($result__model);

    // здесь получаем версию
    $mas = array();
    $query__version = 'SELECT filter_id FROM `oc_category_filter` WHERE category_id = ' . (int)$row__auto[1];
    $result__version = mysqli_query($link, $query__version) or die("Ошибка " . mysqli_error($link));
    $mas = array();
    $ten = 0;
    while (  $row__version  =  mysqli_fetch_row($result__version)  ){
        if($row__version[0] && $row__version[0] != ''){
            $query__pro = 'SELECT name FROM `oc_filter_description` WHERE filter_id = ' . $row__version[0];
            $result__pro = mysqli_query($link, $query__pro) or die("Ошибка " . mysqli_error($link));
            $row__x = mysqli_fetch_row($result__pro);

            $mas[$ten] = $row__x[0];
            $ten++;
        }
    }
    // $mas содержит название модификаций через запятую

    $cheker = 0;
    foreach ($mas as $mas__item) {
        $ext_mas[$cheker]['name'] = $mas__item;
        $mas__item = preg_replace("/.*\((.*?)\).*/","$1",$mas__item);
        $mas__item = explode("-",$mas__item);
        if ($result_item['length'] >= $mas__item[0] && $result_item['length'] <= $mas__item[1]) {
            $ext_mas[$cheker]['expect'] = "это наша модификация";
        }else{
            $ext_mas[$cheker]['expect'] = $mas__item;
        }
        $cheker++;
    }


    foreach($ext_mas as $jet_mas){
        if($jet_mas['expect'] == "это наша модификация"){
            $my_modification = $jet_mas['name'];
        }
    }

    // фиксим проблему с описанием
    $row__desc[3] = strip_tags($row__desc[3]);
    $row__desc[3] = str_replace("\n", ' ', $row__desc[3]);

    $create_data[$jel] = array(
        $result_item['model'], // ext_id
        $row__model[2], // марка
        $row__marka[2], // модель
        $result_item['length'], // год
        $row__type[1], // тип запчасти
        $result_item['version'],// $my_modification,
        $result_item['isbn'], //топливо
        $result_item['jan'], // объем
        $result_item['mpn'], // тип двигателся
        $result_item['upc'], // каробка
        $result_item['ean'], // тип кузова
        $result_item['location'], //диаметр R
        $result_item['width'], // ширина J
        $result_item['height'], // кол-во отверстий
        $result_item['etvylet'],
        $result_item['diadiametr'],
        $result_item['weight'], // pcd
        $result_item['sku'], // номер з/ч
        $row__desc[3], // описание
        0,
        0,
        $sklad,
        $result_item['price'],
        'USD',
        $special_price,
        $city_s,
        $tel,
        '',
        '',
        $images_product,
    );
    $jel++;
}
echo 'CSV экспорт завершён. ';
echo "Дата и Время: " . date("d.m.Y") ." ". date("H:i:s");

// Создаем массив
kama_create_xls_file($create_data, $DIR . 'export/csv_engine_and_transmission.xls');
kama_create_csv_file($create_data, $DIR . 'export/csv_engine_and_transmission.csv');

mysqli_close($link);
?>