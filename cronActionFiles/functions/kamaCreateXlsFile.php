<?php
    /*
     * Функция для сбора массива в XLS
     * */
    function kama_create_xls_file($create_data, $file = null) {
        if (!is_array($create_data) || empty($create_data)) return false;
        if ($file && !is_dir(dirname($file))) return false;
        $html = '<table border="1">';
        foreach ($create_data as $row) {
            $html .= '<tr>';
            foreach ($row as $cell) {
                $html .= '<td>' . htmlspecialchars($cell, ENT_QUOTES | ENT_HTML5, 'UTF-8') . '</td>';
            }
            $html .= '</tr>';
        }
        $html .= '</table>';
        if ($file) {
            $template = <<<XLS
    <!DOCTYPE html>
    <html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40">
    <head>
      <meta charset="UTF-8">
      <meta name=ProgId content=Excel.Sheet>
      <meta name=Generator content="PHP export">
      <style>td{mso-number-format:"\@";}</style>
    </head>
    <body>
    $html
    </body>
    </html>
XLS;
            if (!file_put_contents($file, $template)) {
                die("Не удалось записать файл XLS: $file");
            }
            return $template;
        }
        return $html;
    }
?>