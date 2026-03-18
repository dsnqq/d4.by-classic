<?php
if (strpos($_SERVER['REQUEST_URI'], 'catalog/product/add') === false):

    require_once $_SERVER["DOCUMENT_ROOT"] . '/gd/phpqrcode/qrlib.php';

    // Пути
    $qrDir = $_SERVER["DOCUMENT_ROOT"] . '/gd/qr/';
    $tmpPng = $qrDir . $model . '_tmp.png';
    $mainPng = $qrDir . $model . '_main.png';
    $logoPath = $_SERVER["DOCUMENT_ROOT"] . '/gd/logo.png';

    // Генерация QR-кода во временный PNG
    QRcode::png("https://d4.by/gd/?product_id=" . $_GET['product_id'], $tmpPng, 'Q', 6, 1);

    // Конвертация PNG8 в PNG24 и установка цвета
    $im = imagecreatefrompng($tmpPng);
    $width = imagesx($im);
    $height = imagesy($im);

    // Цвет фона (по умолчанию белый)
    $bgRgb = [255, 255, 255];
    $color_smx = explode('&nbsp;', $cat_qr);
    foreach ($color_qr as $item) {
        if ($item[0] == $color_smx[0]) {
            $bgRgb = [255, 255, 255]; // можно задать другие значения
            break;
        }
    }
    $bgColor = imagecolorallocate($im, ...$bgRgb);
    for ($x = 0; $x < $width; $x++) {
        for ($y = 0; $y < $height; $y++) {
            if (imagecolorat($im, $x, $y) == 0) {
                imagesetpixel($im, $x, $y, $bgColor);
            }
        }
    }

    // Создание итогового изображения
    $dst = imagecreatetruecolor($width, $height);
    imagecopy($dst, $im, 0, 0, 0, 0, $width, $height);
    imagedestroy($im);

    // Логотип
    $logo = imagecreatefrompng($logoPath);
    $logoWidth = imagesx($logo);
    $logoHeight = imagesy($logo);
    $newWidth = $width / 3;
    $newHeight = $logoHeight / ($logoWidth / $newWidth);
    $x = ceil(($width - $newWidth) / 2);
    $y = ceil(($height - $newHeight) / 2);
    imagecopyresampled($dst, $logo, $x, $y, 0, 0, $newWidth, $newHeight, $logoWidth, $logoHeight);

    // Сохранение и удаление временного файла
    imagepng($dst, $mainPng, 3);
    unlink($tmpPng);

    // HTML-вывод
    $imgUrl = "https://d4.by/gd/qr/{$model}_main.png";
    $imgHtml = "<img src='{$imgUrl}' style='width:110px;'>";

    $cat_qr_clean = str_replace('&nbsp;&nbsp;&gt;&nbsp;&nbsp;', ' ', $cat_qr);
    $qr_title = "<div>{$cat_qr_clean}, {$length}г. {$ean}</div>
    <div>{$jan} {$isbn} {$mpn} {$upc}</div>
    <div>{$man_qr}</div>
    <div><span style='font-size:17px;'>{$model}</span></div>";

    echo "<br><br>
    <div style='display:flex;align-items:center;max-width:275px;border:1px solid #000;'>
      <div>{$imgHtml}</div>
      <div style='text-align:center;font-size:12px;padding-left:10px;margin:0 auto;font-weight:bold;line-height:18px;'>
        {$qr_title}
      </div>
    </div>";
    ?>
    <div style="float: right;">
        <button id="printBut" class="btn btn-danger">Печать QR код</button><br><br>
        <a class="btn btn-success" href="https://d4.by/admin/index.php?route=catalog/product/addCopyProduct&product_id=<?= $_GET['product_id']; ?>&token=<?= $_GET['token']; ?>" title="Копировать объявление">Копировать объявление</a>
    </div>
    <div style="clear:both;"></div>
    <iframe name="imgFrame" style="width: 0; height: 0; border: 0; color:#fff;"></iframe>

    <script>
        $('#printBut').on('click', function () {
            var frame = window.frames['imgFrame'];
            frame.document.write(`<!DOCTYPE html>
        <html>
        <head>
            <style>
                @print { @page :footer {color: #fff } @page :header {color: #fff} }
            </style>
        </head>
        <body style="font-family: Open Sans, sans-serif;" onload="window.print()">
            <div style="margin:0 auto;color:#000;display:flex;align-items:center;max-width:275px;border:1px solid #000;">
                <div><?= $imgHtml ?></div>
                <div style="text-align:center;font-size:12px;margin:0 auto;padding-left:10px;font-weight:bold;line-height:18px;"><?= $qr_title ?></div>
            </div>
        </body>
        </html>`);
            frame.document.close();
        });
    </script>
<?php endif; ?>