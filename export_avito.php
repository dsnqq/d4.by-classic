<?php
require_once "config.php";

$hostname = DB_HOSTNAME;
$username = DB_USERNAME;
$password = DB_PASSWORD;
$dbName = DB_DATABASE;

$link = mysqli_connect($hostname, $username, $password, $dbName)
or die("Ошибка " . mysqli_error($link));

$query = "SELECT * FROM `oc_product` WHERE status != '0' AND price > 230 AND manufacturer_id != 262 AND manufacturer_id != 257" ;
$result = mysqli_query($link, $query) or die("Ошибка " . mysqli_error($link));


// Обработка всех данных для з/ч
$export_file = '<Ads formatVersion="3" target="Avito.ru">';

$jel = 1;
$mas = array();
$ext_mas = array();
$my_modification = '';

/*курс*/
$query__currency_id = 'SELECT * FROM `oc_currency` WHERE `code` = "RUB"';
$result__currency_id = mysqli_query($link, $query__currency_id) or die("Ошибка " . mysqli_error($link));
$row__currency_id = mysqli_fetch_row($result__currency_id);
/*курс*/

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
    $query__version = 'SELECT filter_id FROM `oc_category_filter` WHERE category_id = ' . $row__auto[1];
    $result__version = mysqli_query($link, $query__version) or die("Ошибка " . mysqli_error($link));
    $mas = array();
    $ten = 0;
    while (  $row__version  =  mysqli_fetch_row($result__version)  ){
        $query__pro = 'SELECT name FROM `oc_filter_description` WHERE filter_id = ' . $row__version[0];
        $result__pro = mysqli_query($link, $query__pro) or die("Ошибка " . mysqli_error($link));
        $row__x = mysqli_fetch_row($result__pro);

        $mas[$ten] = $row__x[0];
        $ten++;
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

    /*$create_data[$jel] = array(
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
    );*/

    // Умножаем на курс РФ
    $result_item['price'] = (int)$result_item['price']*(int)$row__currency_id[6];

    // Вырезаем номер запчасти, чтобы поместить в название
    $number_for_name = explode(",", $result_item['sku']);
    if($number_for_name && $number_for_name[0] != ''){
        $number_for_name = ' ' . $number_for_name[0];
    } else {
        $number_for_name = '';
    }

    $export_file .= '<Ad>';
    $export_file .= '<Id>' . $result_item['model'] . '</Id>';
    $export_file .= '<Category>Запчасти и аксессуары</Category>';
    $export_file .= '<GoodsType>Запчасти</GoodsType>';
    $export_file .= '<ProductType>Для автомобилей</ProductType>';
    $export_file .= '<AdType>Товар приобретен на продажу</AdType>';
    $export_file .= '<Condition>Б/у</Condition>';
    $export_file .= '<OriginalVendor>' . $row__model[2] . '</OriginalVendor>';
    $export_file .= '<Make>' . $row__model[2] . '</Make>';
    $export_file .= '<Model>' . $row__marka[2] . '</Model>';
    $export_file .= '<BodyType>' . $result_item['ean'] . '</BodyType>';
    $export_file .= '<Generation>' . $result_item['version'] . '</Generation>';
    $export_file .= '<OEM>' . $result_item['sku'] . '</OEM>';
    $export_file .= '<ManagerName>Cергей Cергеевич</ManagerName>';
    $export_file .= '<ContactPhone>+7 982 406-82-06</ContactPhone>';
    $export_file .= '<Address>Дрогичин, улица Заводская, д. 20</Address>';
    $export_file .= '<Title>' . $row__type[1] . $number_for_name . ' к ' . $row__model[2] . ' ' . $row__marka[2] . ', ' . $result_item['length'] . 'г.</Title>';
    $export_file .= '<Description><![CDATA[';
    $export_file .=  '<p>' . $row__desc[3] . '</p>';
    $export_file .= '<ul>';
    $export_file .=  '<li>Артикул: ' . $result_item['model'] . '</li>';
    if($result_item['jan'] && $result_item['jan'] != "") {
        $export_file .= '<li>Объём: ' . $result_item['jan'] . '</li>';
    }
    if($result_item['isbn'] && $result_item['isbn'] != "") {
        $export_file .= '<li>Топливо: ' . $result_item['isbn'] . '</li>';
    }
    if($result_item['mpn'] && $result_item['mpn'] != "") {
        $export_file .= '<li>Тип двигателя: ' . $result_item['mpn'] . '</li>';
    }
    if($result_item['sku'] && $result_item['sku'] != "") {
        $export_file .= '<li>Номер запчасти: ' . $result_item['sku'] . '</li>';
    }
    $export_file .= '<li>Небольшой пробег</li>';
    $export_file .= '<li>Предоставляем гарантию с момента получения запчасти</li>';
    $export_file .= '</ul>';
    $export_file .= '________________';
    $export_file .= '<p>';
    $export_file .= '<strong>Наш склад находится в Республике Беларусь!!! Доставляем по всей России!</strong>';
    $export_file .= '<br/>💣У нас оригинальные Б/У запчасти из Германии, Бельгии, Польши!';
    $export_file .= '<br/>💣 Пока границы закрыты, мы возим!';
    $export_file .= '<br/>💣 Предоставляем гарантии до 30 дней!';
    $export_file .= '<br/>💣 Работаем с транспортными компаниями такими как СДЕК, ПЭК, КИТ, Энергия, DPD.';
    $export_file .= '</p>';
    $export_file .= '________________';
    $export_file .= '<p>';
    $export_file .= '<strong>Ваши преимущества при взаимодействии с нами:</strong>';
    $export_file .= '<br/>🔹 Предоставляем полный пакет документов ( таможенная декларация, GTD, CMR)';
    $export_file .= '<br/>🔹 ДОСТАВКА автозапчастей в любой регион России СДЭКом за 2-5 дней';
    $export_file .= '<br/>🔹 ДОСТАВКА автозапчастей в любой регион России другими видами доставок до 8 дней';
    $export_file .= '<br/>🔹 ОПЛАТА любым удобным для Вас способом (наличный/безналичный расчет)';
    $export_file .= '<br/>🔹 СОТРУДНИЧАЕМ с физ.лицами / с юр.лицами';
    $export_file .= '<br/>🔹 ВЫГОДНАЯ ЦЕНА';
    $export_file .= '</p>';
    $export_file .= '________________';
    $export_file .=  '<p>☎️ Остались вопросы? ЗВОНИТЕ прямо сейчас - ответим на все!<br/>📲 Пишите сообщения в чат Авито и Whatsapp/Viber/Telegram!<br/>💖 И не забудьте добавить это объявление в Избранное, чтобы не потерять!</p>';
    $export_file .= ']]></Description>';
    $export_file .= '<Price>' . $result_item['price'] . '</Price>';
    $export_file .= '<Images>';
    $pnl = 1;
    foreach (explode(",", $images_product) as $item) {
        if($pnl <= 10) {
            $export_file .= '<Image url="' . $item . '" />';
        }
        $pnl++;
    }
    $export_file .= '</Images>';
    if($result_item['youtube'] && $result_item['youtube'] != ''){
        $export_file .= '<VideoURL>https://www.youtube.com/watch?v=' . $result_item['youtube'] . '</VideoURL>';
    }
    $export_file .= '</Ad>';

    $jel++;
}

$export_file .= '</Ads>';

echo 'Выполнено обновление файла XML для заливки З/Ч на avito.ru. ';
echo "Дата и Время: " . date("d.m.Y") ." ". date("H:i:s");

// Создаем файл
file_put_contents('/home/dby/sites/d4.by/export/export_avito.xml', $export_file);

mysqli_close($link);
?>