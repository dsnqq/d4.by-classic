<?php
// Должно совпадать с upload.php: подпапка image/catalog/d4_img/{timestamp}/
$product_list_d4_img_time = (int)strtotime(date('d.m.Y'));
$site_url_photo = '/upload.php';
?>
<script type="text/javascript">window.PRODUCT_LIST_D4_IMG_TIME = <?php echo (int)$product_list_d4_img_time; ?>;</script>
<div id="myModalBox" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Заголовок модального окна -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Загрузка изображения</h4>
            </div>
            <!-- Основное содержимое модального окна -->
            <div class="modal-body">
                <div class="modalShowAddPhoto">
                    <form action="<?=$site_url_photo?>" class="dropzone" id="dropzoneFrom"></form>
                    <br><br>
                    <div style="text-align:center;">
                        <button type="button" class="btn btn-info" id="submit-all">Загрузить изображения</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>