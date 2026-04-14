$(function () {
        // Выбор главного фото
    $('body').on('click', '.main_image', function () {
        const mainPhoto = $(this).closest('.itemsBlock').find('.image_for_main').val();
        $('button').removeClass('activeMain');
        $(this).addClass('activeMain');
        
        // Убедимся что поле image существует, создадим если нужно
        let $mainImageInput = $('input[name="image"]');
        if ($mainImageInput.length === 0) {
            // Создаём поле для главного фото если его нет (вне #preview для надёжности)
            $('#preview').before('<input type="hidden" name="image" value="" class="input-image-main-dop">');
            $mainImageInput = $('input[name="image"]');
        }
        $mainImageInput.val(mainPhoto);
    });

    // Открытие модалки
    $('.modalOpenAddPhotoMe').on('click', () => {
        $("#myModalBox").modal('show');
    });

    // Dropzone конфиг
    Dropzone.options.dropzoneFrom = {
        url: 'https://d4.by/upload.php',
        autoProcessQueue: false,
        parallelUploads: 20,
        maxThumbnailFilesize: 2000,
        resizeWidth: 1200,
        timeout: 180000000,
        renameFile: file => `${Date.now()}_${file.name}`,
        init: function () {
            const myDropzone = this;

            document.querySelector('#submit-all').addEventListener("click", () => {
                myDropzone.processQueue();
            });

                        this.on("queuecomplete", function () {
                const path = 'image/catalog/d4_img';
                const folderName = `${path}/<?=$time?>/`;
                const maskName = `catalog/d4_img/<?=$time?>/`;
                let sameFile = $('.itemsBlock').length || 0;

                // Убедимся что есть контейнер для фото
                if ($('#preview').html().trim() === '' || $('#preview .row').length === 0) {
                    $('#preview').html('<div class="row itemsBlockFlex"></div>');
                }

                // Проверяем есть ли поле для главного фото (вне #preview)
                let $mainImageInput = $('input[name="image"]');
                let mainImageUnset = $mainImageInput.length === 0 || !$mainImageInput.val() || String($mainImageInput.val()).trim() === '';
                let mainFromDropzoneSet = false;

                myDropzone.files.forEach((file, index) => {
                    if (!file) return;
                    const classActive = (sameFile === 0 && mainImageUnset) ? "activeMain" : "";
                    const imgHtml = `
                        <div class="itemsBlock">
                            <img src="${file.dataURL}" class="img-thumbnail" width="175" height="175" style="height:175px;" />
                            <input type="hidden" class="image_for_main" name="product_image[${sameFile}][image]" value="${maskName}${file.upload.filename}">
                            <input type="hidden" name="product_image[${sameFile}][sort_order]" class="sort_order" value="">
                            <button type="button" class="btn btn-link remove_image" id="${folderName}${file.upload.filename}">Удалить</button>
                            <button type="button" class="btn btn-link main_image ${classActive}">Главное фото</button>
                        </div>`;

                    $('#preview .row').append(imgHtml);

                    // Устанавливаем первое загруженное фото как главное, если главное ещё не установлено
                    if (mainImageUnset && !mainFromDropzoneSet) {
                        // Создаём поле image если его ещё нет (вне #preview)
                        if ($mainImageInput.length === 0) {
                            $('#preview').before(`<input type="hidden" name="image" value="${maskName}${file.upload.filename}" class="input-image-main-dop">`);
                            $mainImageInput = $('input[name="image"]');
                        } else {
                            $mainImageInput.val(maskName + file.upload.filename);
                        }
                        mainFromDropzoneSet = true;
                    }

                    sameFile++;
                });

                this.removeAllFiles();
                $("#myModalBox").modal('hide');
            });
        }
    };

        // Удаление фото
    $(document).on('click', '.remove_image', function () {
        const $itemBlock = $(this).closest('.itemsBlock');
        const wasMain = $itemBlock.find('.main_image').hasClass('activeMain');
        
        $itemBlock.remove();
        
        // Если удалили главное фото, нужно выбрать новое главное
        if (wasMain) {
            const $firstItem = $('.itemsBlock').first();
            if ($firstItem.length > 0) {
                const firstImagePath = $firstItem.find('.image_for_main').val();
                $firstItem.find('.main_image').addClass('activeMain');
                $('input[name="image"]').val(firstImagePath);
            } else {
                // Если фото не осталось, очищаем поле image
                $('input[name="image"]').val('');
            }
        }
    });

        // Получение изображений
    function listImage() {
        $.get("<?=$site_url_photo?>", function (data) {
            if (!$('#preview').html().trim()) {
                $('#preview').html(`<div class="row itemsBlockFlex">${data}</div>`);
            } else {
                $('#preview .row').html(data);
            }
            
            // После загрузки изображений проверяем есть ли поле image
            // и устанавливаем активное главное фото если нужно
            if ($('input[name="image"]').length === 0 && $('.itemsBlock').length > 0) {
                // Если поля image нет, но есть фото - создаём поле и делаем первое фото главным
                var firstImagePath = $('.itemsBlock').first().find('.image_for_main').val();
                $('#preview').before('<input type="hidden" name="image" value="' + firstImagePath + '" class="input-image-main-dop">');
                $('.itemsBlock').first().find('.main_image').addClass('activeMain');
            }
        });
    }

    // Общая функция для добавления блока спеццены
    function insertSpecialPriceBlock(price) {
        const html = `
        <div class="table-responsive"> Цена для сайта:
            <table id="special" class="">
                <thead class="hide">
                    <tr>
                        <td class="text-left">Группа покупателей:</td>
                        <td class="text-right">Приоритет:</td>
                        <td class="text-right">Цена в долларах:</td>
                        <td class="text-left">Дата начала:</td>
                        <td class="text-left">Дата окончания:</td>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <tr id="special-row0">
                        <td class="text-left hide">
                            <select name="product_special[0][customer_group_id]" class="form-control">
                                <option value="1">Default</option>
                            </select>
                        </td>
                        <td class="text-right hide">
                            <input type="text" name="product_special[0][priority]" value="<?php $product_specials[0]['priority']; ?>" class="form-control">
                        </td>
                        <td class="text-right">
                            <input type="text" name="product_special[0][price]" value="${price}" class="itogo_price" style="border:none;outline:none;">
                        </td>
                        <td class="text-left hide">
                            <div class="input-group date">
                                <input type="text" name="product_special[0][date_start]" value="<?php $product_specials[0]['date_start']; ?>" class="form-control">
                                <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                            </div>
                        </td>
                        <td class="text-left hide">
                            <div class="input-group date">
                                <input type="text" name="product_special[0][date_end]" value="<?php $product_specials[0]['date_end']; ?>" class="form-control">
                                <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
                            </div>
                        </td>
                        <td class="text-left hide">
                            <button type="button" data-toggle="tooltip" title="Удалить" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>`;
        $('#special_class').html(html);
    }

    // Расчёт спеццены
    function calculateSpecialPrice() {
        const price = parseInt($('#input-price').val()) || 0;
        const percent = parseInt($('.procent_price').val()) || 0;
        const itogo = price - (price / 100) * percent;

        if (percent >= 5) {
            if (!$('#special_class').children().length) {
                insertSpecialPriceBlock(itogo.toFixed());
            } else {
                $('.itogo_price').val(itogo.toFixed());
            }
        } else {
            $('#special_class').empty();
            $('.itogo_price').val(price);
        }
    }

    $('.procent_price, #input-price').on('input', function () {
        const $this = $(this);
        const val = $this.val().replace(/[^0-9]/g, '');
        const min = $this.data('min');
        const max = $this.data('max');

        $this.val(Math.min(Math.max(val, min), max));
        calculateSpecialPrice();
    });
});
