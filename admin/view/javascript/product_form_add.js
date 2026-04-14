$(function () {
    // Выбор главного фото
    $('body').on('click', '.main_image', function () {
        const mainPhoto = $(this).closest('.itemsBlock').find('.image_for_main').val();
        $('button').removeClass('activeMain');
        $(this).addClass('activeMain');
        $('.input-image-main-dop').val(mainPhoto);
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

                myDropzone.files.forEach((file, index) => {
                    if (!file) return;
                    const classActive = sameFile === 0 ? "activeMain" : "";
                    const imgHtml = `
                        <div class="itemsBlock">
                            <img src="${file.dataURL}" class="img-thumbnail" width="175" height="175" style="height:175px;" />
                            <input type="hidden" class="image_for_main" name="product_image[${sameFile}][image]" value="${maskName}${file.upload.filename}">
                            <input type="hidden" name="product_image[${sameFile}][sort_order]" class="sort_order" value="">
                            <button type="button" class="btn btn-link remove_image" id="${folderName}${file.upload.filename}">Удалить</button>
                            <button type="button" class="btn btn-link main_image ${classActive}">Главное фото</button>
                        </div>`;

                    if (!$('#preview').html().trim() || !$('.input-image-main-dop').val()) {
                        $('#preview').html(`<div class="row itemsBlockFlex"><input type="hidden" name="image" value="${maskName}${file.upload.filename}" class="input-image-main-dop">${imgHtml}</div>`);
                    } else {
                        $('#preview .row').append(imgHtml);
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
        $(this).closest('.itemsBlock').remove();
    });

    // Получение изображений
    function listImage() {
        $.get("<?=$site_url_photo?>", function (data) {
            if (!$('#preview').html().trim()) {
                $('#preview').html(`<div class="row">${data}</div>`);
            } else {
                $('#preview .row').html(data);
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
