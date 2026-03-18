<?php $site_url_photo = "https://d4.by/upload.php"; ?>

<!-- HTML-код модального окна -->
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
                    <!---<form action="<?=$site_url_photo?>" class="dropzone" id="dropzoneFrom"></form>-->
                    <div class="dropzone" id="dropzoneFrom"></div>
                    <br><br>
                    <div style="text-align:center;">
                        <button type="button" class="btn btn-info" id="submit-all">Загрузить изображения</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>