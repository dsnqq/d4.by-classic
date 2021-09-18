<?php
    /* 
    $hostname = "localhost"; // название/путь сервера, с MySQL
    $username = "dby_user"; // имя пользователя (в Denwer`е по умолчанию "root")
    $password = "LhePBA4v6Lc8k6"; // пароль пользователя (в Denwer`е по умолчанию пароль отсутствует, этот параметр можно оставить пустым)
    $dbName = "dby_bd"; // название базы данных
    */
    require_once "config.php";
    $hostname = DB_HOSTNAME;
    $username = DB_USERNAME;
    $password = DB_PASSWORD;
    $dbName = DB_DATABASE;

    $link = mysqli_connect($hostname, $username, $password, $dbName) 
    or die("Ошибка " . mysqli_error($link));

    /* Получить модификации */
    $category_id = $_POST['category_id'];

    $query = "SELECT filter_id FROM oc_category_filter WHERE category_id = '" . (int)$category_id . "'";
    $result = mysqli_query($link, $query) or die("Ошибка " . mysqli_error($link)); 
    while($filter_group = mysqli_fetch_array($result)){
        
        $query_desc = "SELECT name FROM oc_filter_description WHERE filter_id = '" . (int)$filter_group["filter_id"] . "'";
        $result_desc = mysqli_query($link, $query_desc) or die("Ошибка " . mysqli_error($link)); 
        while($filter_name = mysqli_fetch_array($result_desc)){
            echo "<div class='link_modification'> - ".$filter_name['name'].'</div>';
        }
    }


    mysqli_close($link);
?>