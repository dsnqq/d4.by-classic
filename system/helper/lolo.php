<?php 

/*
 * true or false
 */
const LOLO_VERBOSE_LOG = false;

function lolo_log($message){
    
    if (LOLO_VERBOSE_LOG == false) return;
    
    $oFile = fopen(DIR_LOGS.'/error.log', 'a+');
    fwrite($oFile, date('Y-m-d G:i:s') . ' - ' . "[lolo] " . $message . "\n");
    fclose($oFile);
}