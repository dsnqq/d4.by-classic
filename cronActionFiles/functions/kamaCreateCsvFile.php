<?php
    /*
     * Функция для сбора массива в CSV
     * */
    function kama_create_csv_file($create_data, $file = null, $col_delimiter = ';', $row_delimiter = "\r\n") {
        if (!is_array($create_data)) return false;
        if ($file && !is_dir(dirname($file))) return false;

        $CSV_str = '';
        foreach ($create_data as $row) {
            $cols = array_map(function ($col_val) use ($row_delimiter) {
                if ($col_val && preg_match('/[",;\r\n]/', $col_val)) {
                    $col_val = str_replace(["\r\n", "\r"], ['\n', ''], $col_val);
                    $col_val = str_replace('"', '""', $col_val);
                }
                return '"' . $col_val . '"';
            }, $row);
            $CSV_str .= implode($col_delimiter, $cols) . $row_delimiter;
        }

        $CSV_str = rtrim($CSV_str, $row_delimiter);
        return $file ? (file_put_contents($file, $CSV_str) ? $CSV_str : false) : $CSV_str;
    }
?>