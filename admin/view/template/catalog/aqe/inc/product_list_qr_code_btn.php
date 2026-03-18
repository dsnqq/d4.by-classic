<?php
    require_once $_SERVER['DOCUMENT_ROOT'].'/gd/phpqrcode/qrlib.php';

    $product['cat_qr'] = str_replace('&nbsp;&nbsp;&gt;&nbsp;&nbsp;', ' ', $product['cat_qr']);
    $qr_title = sprintf(
        '<div>%s, %sg. %s</div><div>%s %s %s %s</div><div>%s</div><div><span style="font-size:17px;">%s</span></div>',
        $product['cat_qr'], $product['length'], $product['ean'],
        $product['jan'], $product['isbn'], $product['mpn'], $product['upc'],
        $product['manufers'], $product['modelQR']
    );

    // Пути к файлам
    $qr_dir = $_SERVER['DOCUMENT_ROOT'].'/gd/qr/';
    $tmp_qr_path = $qr_dir . $product['modelQR'] . '_tmp.png';
    $main_qr_path = $qr_dir . $product['modelQR'] . '_main.png';

    // Генерация временного QR-кода
    QRcode::png("https://d4.by/gd/?product_id={$product['product_id']}", $tmp_qr_path, 'Q', 6, 1);

    // Конвертация PNG8 в PNG24 + Замена черного фона на белый
    $im = imagecreatefrompng($tmp_qr_path);
    $width = imagesx($im);
    $height = imagesy($im);

    $bg_color = imagecolorallocate($im, 255, 255, 255);

    for ($x = 0; $x < $width; $x++) {
        for ($y = 0; $y < $height; $y++) {
            if (imagecolorat($im, $x, $y) == 0) {
                imagesetpixel($im, $x, $y, $bg_color);
            }
        }
    }

    $dst = imagecreatetruecolor($width, $height);
    imagecopy($dst, $im, 0, 0, 0, 0, $width, $height);
    imagedestroy($im);

    // Наложение логотипа (если файл существует)
    $logo_path = $_SERVER['DOCUMENT_ROOT'].'/gd/logo.png';
    if (file_exists($logo_path)) {
        $logo = imagecreatefrompng($logo_path);
        $logo_width = imagesx($logo);
        $logo_height = imagesy($logo);

        $new_width = $width / 3;
        $new_height = $logo_height / ($logo_width / $new_width);

        $x = ceil(($width - $new_width) / 2);
        $y = ceil(($height - $new_height) / 2);

        imagecopyresampled($dst, $logo, $x, $y, 0, 0, $new_width, $new_height, $logo_width, $logo_height);
    }

    // Сохранение финального QR-кода и удаление временного
    imagepng($dst, $main_qr_path, 3);
    unlink($tmp_qr_path);
    imagedestroy($dst);
?>

<!-- Кнопка печати QR-кода -->
<div style="color: #23b423; border-color: #23b423;" class="btn btn-default printQrOuterLists"
     data-qrmodel="<?= htmlspecialchars($product['modelQR'], ENT_QUOTES, 'UTF-8'); ?>"
     data-qrid="<?= (int) $product['product_id']; ?>"
     data-titles='<?= htmlspecialchars($qr_title, ENT_QUOTES, 'UTF-8'); ?>'>Печать QR код</div>