<?php 
    ##	/usr/local/bin/ea-php72 /home/dby/public_html/export.php
    ## Для операции по крон путь


    ## Создает CSV файл из переданных в массиве данных.
    ## @param array  $create_data  Массив данных из которых нужно созать CSV файл.
    ## @param string $file         Путь до файла 'path/to/test.csv'. Если не указать, то просто вернет результат.
    ## @return string/false        CSV строку или false, если не удалось создать файл.
    ## ver 2
    function kama_create_csv_file( $create_data, $file = null, $col_delimiter = ';', $row_delimiter = "\r\n" ){

        if( ! is_array($create_data) )
            return false;

        if( $file && ! is_dir( dirname($file) ) )
            return false;

        // строка, которая будет записана в csv файл
        $CSV_str = '';

        // перебираем все данные
        foreach( $create_data as $row ){
            $cols = array();

            foreach( $row as $col_val ){
                // строки должны быть в кавычках ""
                // кавычки " внутри строк нужно предварить такой же кавычкой "
                if( $col_val && preg_match('/[",;\r\n]/', $col_val) ){
                    // поправим перенос строки
                    if( $row_delimiter === "\r\n" ){
                        $col_val = str_replace( "\r\n", '\n', $col_val );
                        $col_val = str_replace( "\r", '', $col_val );
                    }
                    elseif( $row_delimiter === "\n" ){
                        $col_val = str_replace( "\n", '\r', $col_val );
                        $col_val = str_replace( "\r\r", '\r', $col_val );
                    }

                    $col_val = str_replace( '"', '""', $col_val ); // предваряем "
                }
                $col_val = '"'. $col_val .'"'; // обрамляем в "

                $cols[] = $col_val; // добавляем колонку в данные
            }

            $CSV_str .= implode( $col_delimiter, $cols ) . $row_delimiter; // добавляем строку в данные
        }

        $CSV_str = rtrim( $CSV_str, $row_delimiter );

        // задаем кодировку windows-1251 для строки
        if( $file ){
            //$CSV_str = iconv( "UTF-8", "cp1251",  $CSV_str );

            // создаем csv файл и записываем в него строку
            $done = file_put_contents( $file, $CSV_str );

            return $done ? $CSV_str : false;
        }

        return $CSV_str;

    }
    //require_once "catalog/model/extension/module/watermark/image.watermark.php";
    require_once "config.php";
    include('simple_html_dom.php');

    $hostname = DB_HOSTNAME;
    $username = DB_USERNAME;
    $password = DB_PASSWORD;
    $dbName = DB_DATABASE;

    $link = mysqli_connect($hostname, $username, $password, $dbName) 
    or die("Ошибка " . mysqli_error($link));
    
    $query = "SELECT * FROM `oc_shiny` WHERE status != '0'";
    $result = mysqli_query($link, $query) or die("Ошибка " . mysqli_error($link)); 

    // наш массив создаем с заголовками
    $create_data = array(
        array(
            'ID_EXT',
            'МАРКА',
            'МОДЕЛЬ',
            'ШИРИНА',
            'ВЫСОТА',
            'ДИАМЕТР',
            'СЕЗОН',
            'СОСТОЯНИЕ',
            'КОЛИЧЕСТВО',
            'ГОД',
            'ТИП ШИН',
            'ЦЕНА',
            'ВАЛЮТА',
            'КОММЕНТАРИЙ',
            'ТЕЛЕФОН',
            'EMAIL',
            'ИМЯ',
            'АДРЕС',
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
        $query__images = 'SELECT * FROM `oc_shiny_image` WHERE product_id = ' . (int)$result_item['product_id'] . ' ORDER BY sort_order ASC' ;
        $result__images = mysqli_query($link, $query__images) or die("Ошибка " . mysqli_error($link)); 
        $images_product = ''; // переменная для доп.изобр.
        while($row__images = mysqli_fetch_array($result__images)){ // находим все нужные доп.изображения
            if($row__images['image'] != ""){
                $images_product .= HTTPS_SERVER.'image/'.$row__images['image'].',';
            }
        }
        $images_product = substr($images_product,0,-1); // удаляем последнюю запятую

        // достаем описание
        $query__desc = 'SELECT * FROM `oc_shiny_description` WHERE product_id = ' . (int)$result_item['product_id'];
        $result__desc = mysqli_query($link, $query__desc) or die("Ошибка " . mysqli_error($link));
        $row__desc = mysqli_fetch_row($result__desc);
        $row__desc[3] = strip_tags($row__desc[3]);
        $row__desc[3] = str_replace("\n", ' ', $row__desc[3]);

        // достаем телефон и складскую информацию
                
        $tel = '';
        $sklad = '';
        $city_s = '';
        $query__attr = 'SELECT * FROM `oc_shiny_attribute` WHERE product_id = ' . (int)$result_item['product_id'];
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



        $create_data[$jel] = array(

            $result_item['model'], // EXT_ID
            $result_item['ean'], // Марка
            $result_item['upc'], // Модель
            $result_item['jan'], // Ширина
            $result_item['isbn'], //Высота
            $result_item['mpn'], //Диаметр
            $result_item['sku'], //Сезон
            $result_item['location'], //Состояние
            $result_item['quantity'], // Кол-во
            $result_item['length'], // Год
            $result_item['version'], // Тип шин
            $result_item['price'], // Цена
            'USD',
            $row__desc[3], //КОММЕНТАРИЙ
            $tel, //ТЕЛЕФОН
            'info@d4.by', //EMAIL
            '', //ИМЯ
            $city_s, //АДРЕС
            $images_product, //Фото
        );
        $jel++;
    }
    echo 'Выполнено обновление файла для заливки Шин на bamper.by. ';
    echo "Дата и Время: " . date("d.m.Y") ." ". date("H:i:s");

    // Создаем массив
    kama_create_csv_file( $create_data, '/home/dby/sites/d4.by/bamper/' .'csv_for_bamper_shiny.csv' );

    mysqli_close($link);
?>