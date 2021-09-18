<?php

    echo '<link href="/catalog/view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet">';

    require_once "/home/dby/sites/d4.by/config.php";

    $hostname = DB_HOSTNAME;
    $username = DB_USERNAME;
    $password = DB_PASSWORD;
    $dbName = DB_DATABASE;

    
    $link = mysqli_connect($hostname, $username, $password, $dbName) 
    or die("Ошибка " . mysqli_error($link));

    $product_id_get = trim($_GET['product_id']);

    if(preg_match('~\D+~', $product_id_get)){
        header("Location: https://d4.by");
        die();
    }

    $product_id_get = preg_replace('~\D+~','', $product_id_get);

    $query = "SELECT * FROM `oc_product` WHERE product_id = " . $product_id_get;
    $result = mysqli_query($link, $query) or die("Ошибка " . mysqli_error($link));


    $query_cur = "SELECT * FROM `oc_currency` WHERE code = 'RUB'";
    $result__cur = mysqli_query($link, $query_cur) or die("Ошибка " . mysqli_error($link));
    $row__cur = mysqli_fetch_row($result__cur);


    $query_cur1 = "SELECT * FROM `oc_currency` WHERE code = 'BYN'";
    $result__cur1 = mysqli_query($link, $query_cur1) or die("Ошибка " . mysqli_error($link));
    $row__cur1 = mysqli_fetch_row($result__cur1);

    echo '<table class="table table-bordered table-inverse" style="max-width: 500px;margin: 0 auto;">';
    
        while($result_item = mysqli_fetch_array($result)){
                $status = ($result_item['status'] == 1) ? "Активно" : "Неактивно";

                // Description
                $query__desc = 'SELECT * FROM `oc_product_description` WHERE product_id = ' . $product_id_get;
                $result__desc = mysqli_query($link, $query__desc) or die("Ошибка " . mysqli_error($link));
                $row__desc = mysqli_fetch_row($result__desc);
                $row__desc[3] = strip_tags($row__desc[3]);
                $row__desc[3] = str_replace("\n", ' ', $row__desc[3]);

                $tel = '';
                $sklad = '';
                $city_s = '';
                $query__attr = 'SELECT * FROM `oc_product_attribute` WHERE product_id = ' . $product_id_get;
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

                //достаем тип запчасти
                $query__type = 'SELECT * FROM `oc_manufacturer` WHERE manufacturer_id = ' . (int)$result_item['manufacturer_id'];
                $result__type = mysqli_query($link, $query__type) or die("Ошибка " . mysqli_error($link));
                $row__type = mysqli_fetch_row($result__type);

                // достаем марку и модель
                $query__auto = 'SELECT * FROM `oc_product_to_category` WHERE product_id = ' . $product_id_get;
                $result__auto = mysqli_query($link, $query__auto) or die("Ошибка " . mysqli_error($link));
                $row__auto = mysqli_fetch_row($result__auto);
                //$row__auto[1]; это наша категория_id
                $query__marka = 'SELECT * FROM `oc_category_description` WHERE category_id = ' . (int)$row__auto[1];
                $result__marka = mysqli_query($link, $query__marka) or die("Ошибка " . mysqli_error($link));
                $row__marka = mysqli_fetch_row($result__marka);
                //$row__marka[2]; это наша название модели
                // ищем категорию родитель ID
                $query__parentid = 'SELECT * FROM `oc_category` WHERE category_id = ' . (int)$row__auto[1];
                $result__parentid = mysqli_query($link, $query__parentid) or die("Ошибка " . mysqli_error($link));
                $row__parentid = mysqli_fetch_row($result__parentid);
                // $row__parentid[2] id нашей категории а именно марки
                $query__model = 'SELECT * FROM `oc_category_description` WHERE category_id = ' . (int)$row__parentid[2];
                $result__model = mysqli_query($link, $query__model) or die("Ошибка " . mysqli_error($link));
                $row__model = mysqli_fetch_row($result__model);
                //$row__model[2] здесь наша марка по сути

            $h1_this = $row__type[1] . " к " . $row__model[2] . " " . $row__marka[2] . ", " . $result_item['length'] . "г.";
            $result_item['date_added'] = mb_substr($result_item['date_added'], 0, -9);

            //R15; 6.0j; 4-114.3; ET-46; DIA - 56.1
            $disk_info = "";
            $disk_info .= $result_item['location'];
            if($result_item['width'] != "" && $result_item['width'] != 0){
                $disk_info .= "; " . $result_item['width']. "j; ";
            }
            if($result_item['height'] != "" && $result_item['height'] != 0){
                $disk_info .= $result_item['height']. "-";
            }
            if($result_item['weight'] != "" && $result_item['weight'] != 0){
                $disk_info .= $result_item['weight']."; ";
            }
            if($result_item['etvylet'] != "" && $result_item['etvylet'] != 0){
                $disk_info .= "ET-" . $result_item['etvylet']."; ";
            }
            if($result_item['diadiametr'] != "" && $result_item['diadiametr'] != 0){
                $disk_info .= "DIA-" . $result_item['diadiametr'];
            }
            $price_RUB = (float)$result_item['price']*$row__cur[6];
            $price_BYN = (float)$result_item['price']*$row__cur1[6];
            $price_RUB = round($price_RUB, 0);
            $price_BYN = round($price_BYN, 2);

            if($result_item['upc'] != ""){
                $result_item['upc'] = '<strong>Коробка: </strong>' .  $result_item['upc'] . '<br>';
            }
            if($result_item['ean'] != ""){
                '<strong>Тип кузова: </strong>' . $result_item['ean'] . '<br>';
            }
            if($disk_info != ""){
                $disk_info = '<br>' . $disk_info. '<br>';
            }
            if($status == "Активно"){
                $colorStatus = "green";
            } else{
                $colorStatus = "red";
            }
           
            echo '<tr>';
                    echo '<td class="head_table">Фото</td><td><img src="/image/'.$result_item['image'].'" width="250px"></td>';
            echo '</tr><tr>';
                    echo '<td class="head_table">Артикул</td><td>'.$result_item['model'].'</td>';
            echo '</tr><tr>';
                    echo '<td class="head_table">Название</td><td>'.$h1_this.$disk_info.'</td>';
            echo '</tr><tr>';
                    echo '<td class="head_table">Объем</td><td>'.$result_item['jan'].'</td>';
            echo '</tr><tr>';
                    echo '<td class="head_table">Тип топлива</td><td>'.$result_item['isbn'].'</td>';
            echo '</tr><tr>';
                    echo '<td class="head_table">Номер З/Ч</td><td>'.$result_item['sku'].'</td>';
            echo '</tr><tr>';
                    echo '<td class="head_table">Дата создания</td><td>'.$result_item['date_added'].'</td>';
            echo '</tr><tr>';
                    echo '<td class="head_table">Описание + Инфо</td><td style="width: 250px;">'.$row__desc[3].'<br><br>'.$result_item['upc'].$result_item['ean'].'</td>';
            if($sklad != ""){
                echo '</tr><tr>';
                    echo '<td class="head_table">Заметка</td><td style="color:red;">'.$sklad.'</td>';
                echo '</tr><tr>';
            }
            echo '</tr><tr>';
                    echo '<td class="head_table">Статус</td><td style="color:#fff;background:'.$colorStatus.';">'.$status.'</td>';
            echo '</tr><tr>';
                    echo '<td class="head_table">Цена</td><td style="width: 101px;">'.$result_item['price'].' $<br>'.$price_RUB.' RUB<br>'.$price_BYN.' BYN</td>';
            echo '</tr>';
        }
    echo '</table>';
?>
<style>
    table{
        width: 100%;
        border-spacing: unset;
        border-collapse: collapse;
    }
    table td{
        border: 1px solid black;
        font-size: 14px;
    }
    table tr:first-child td{
        font-weight: bold;
        font-size: 16px;
    }
    table tr:not(:first-child) td{
        font-size: 16px;    font-weight: bold;

    }
    .head_table{
        background:#1C7ED6;
        color:#fff;
        text-align:center;
    }
</style>