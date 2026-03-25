<?php
// PARAMS
set_time_limit(0);
$date_now = date("d.m.Y");
$time = strtotime($date_now);
$path = 'image/catalog/d4_img';
$path_time = $path."/".$time."/";
$mask_name = 'catalog/d4_img/' . $time;
$output = '';

// FUNCTIONS
if(!is_dir($path)){
    mkdir($path, 0777);
}
if(!is_dir($path_time)){
    mkdir($path_time, 0777);
}
$folder_name = $path_time;

if(!empty($_FILES))
{
 $temp_file = $_FILES['file']['tmp_name'];
 $location = $folder_name . $_FILES['file']['name'];
 move_uploaded_file($temp_file, $location);
}

?>