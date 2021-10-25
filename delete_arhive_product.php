<?php
require_once "config.php";

$hostname = DB_HOSTNAME;
$username = DB_USERNAME;
$password = DB_PASSWORD;
$dbName = DB_DATABASE;

$link = mysqli_connect($hostname, $username, $password, $dbName) 
or die("Ошибка " . mysqli_error($link));

// Функция на удаление фото которые относятся к архивным
function delete_image($path) {
    if (isset($path)) {
        $path = rtrim(DIR_IMAGE  . $path);

        if (!file_exists($path)) {
            $error= 1;
        }

        if ($path == rtrim(DIR_IMAGE . 'catalog/', '/')) {
            $error = 1;
        }
    } else {
        $error = 1;
    }


    if (!isset($error)) {
        if (is_file($path)) {
            unlink($path);
        } elseif (is_dir($path)) {
            //$this->recursiveDelete($path);
        }

    }				

}

$query = "SELECT * FROM `oc_arhive`" ;
$result = mysqli_query($link, $query) or die("Ошибка " . mysqli_error($link));

while($result_item = mysqli_fetch_array($result)){

    // Узнаем сколько прошло дней с момента удаления з/ч
    $now = time();
    $your_date = strtotime($result_item['date_delete']);
    $datediff = $now - $your_date;
    $deleteDay = round($datediff / (60 * 60 * 24));

    // Проверка на кол-во дней у з/ч
    if($result_item['date_delete'] == "" || $deleteDay >= 30){
        // Удаляем фото из директорий
        $queryImage = "SELECT image FROM oc_arhive WHERE product_id = '" . (int)$result_item['product_id'] . "'";
        $resultImage = mysqli_query($link, $queryImage) or die("Ошибка " . mysqli_error($link));
        while($result_itx = mysqli_fetch_array($resultImage)){
            delete_image($result_itx['image']);
        }
        
        // Удаляем доп.фото
        $queryImages = "SELECT image FROM oc_arhive_image WHERE product_id = '" . (int)$result_item['product_id'] . "'";
        $resultImages = mysqli_query($link, $queryImages) or die("Ошибка " . mysqli_error($link));
        while($result_images = mysqli_fetch_array($resultImages)){
            delete_image($result_images['image']);
        }

        // Удаляем информацию из таблиц
        $deleteArhiveProductAttr = "DELETE FROM oc_arhive_attribute WHERE product_id = '" . (int)$result_item['product_id'] . "'";
        $deleteArhiveProductAttrSuccess = mysqli_query($link, $deleteArhiveProductAttr) or die("Ошибка " . mysqli_error($link));
        
        $deleteArhiveProductDesc = "DELETE FROM oc_arhive_description WHERE product_id = '" . (int)$result_item['product_id'] . "'";
        $deleteArhiveProductDescSuccess = mysqli_query($link, $deleteArhiveProductDesc) or die("Ошибка " . mysqli_error($link));
        
        $deleteArhiveProductImg = "DELETE FROM oc_arhive_image WHERE product_id = '" . (int)$result_item['product_id'] . "'";
        $deleteArhiveProductImgSuccess = mysqli_query($link, $deleteArhiveProductImg) or die("Ошибка " . mysqli_error($link));
        
        $deleteArhiveProductCat = "DELETE FROM oc_arhive_to_category WHERE product_id = '" . (int)$result_item['product_id'] . "'";
        $deleteArhiveProductCatSuccess = mysqli_query($link, $deleteArhiveProductCat) or die("Ошибка " . mysqli_error($link));
        
        $deleteArhiveProductLay = "DELETE FROM oc_arhive_to_layout WHERE product_id = '" . (int)$result_item['product_id'] . "'";
        $deleteArhiveProductLaySuccess = mysqli_query($link, $deleteArhiveProductLay) or die("Ошибка " . mysqli_error($link));
        
        $deleteArhiveProductStore = "DELETE FROM oc_arhive_to_store WHERE product_id = '" . (int)$result_item['product_id'] . "'";
        $deleteArhiveProductStoreSuccess = mysqli_query($link, $deleteArhiveProductStore) or die("Ошибка " . mysqli_error($link));
        
        $deleteArhiveProduct = "DELETE FROM oc_arhive WHERE product_id = '" . (int)$result_item['product_id'] . "'";
        $deleteArhiveProductSuccess = mysqli_query($link, $deleteArhiveProduct) or die("Ошибка " . mysqli_error($link)); 
    } 
    
}
mysqli_close($link); 
