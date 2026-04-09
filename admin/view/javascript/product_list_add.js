$(function() {
    const urlParams = new URLSearchParams(window.location.search);
    const token = urlParams.get('token') || '';
    // Удаление
    $(".deletedButton").on("click", function () {
        return confirm("Вы действительно хотите удалить З/Ч ?");
    });

    // ISBN топливо
    $('.isbn_toplivo').on('change', function() {
        const val = $(this).val();
        $('#isbn_toplivo').val(val === "*" ? "" : val);
    });

    // Открыть модалку добавления фото
    $('.addPhotoButton').on('click', function() {
        const productid = $(this).data('productid');
        $('#submit-all').attr('data-productid', productid);
        $("#myModalBox").modal('show');
    });

    // История товара
    $('.historyProduct').on('click', function() {
        const productid = $(this).data('productid');
        const productinfo = $(this).data('productinfo');

        $('#myModalBoxHistoryNumber').text(productid);
        $('.modal-subtitle').empty();
        $('.historyTable').empty();
        $("#myModalBoxHistory").modal('show');
        loadHistory(productid, productinfo);
    });

    $('body').on('change', '#filter_yeaerChange, #filter_yeaerChange1', function () {
        const getSelectedYear = (selector) => {
            let year = "";
            $(`#${selector} ul.dropdown-menu.inner li.selected`).each(function () {
                const text = $(this).text();
                year = (text !== "Год") ? text : "";
            });
            return year;
        };

        const first_year = getSelectedYear('filter_yeaerChangeTh');
        const last_year  = getSelectedYear('filter_yeaerChangeTh1');

        let value = "";

        if (first_year && last_year) {
            value = `${first_year}<=${last_year}`;
        } else if (first_year) {
            value = `${first_year}<=`;
        } else if (last_year) {
            value = `<=${last_year}`;
        }

        $('#filter_yeaerChangeData').val(value).attr("value", value);
    });

    function loadHistory(productid, productinfo) {
        $.ajax({
            url: `index.php?route=catalog/product/getChangeProduct&token=${token}&product_id=${productid}`,
            method: 'POST',
            data: { product_id: productid },
            dataType: 'json',
            cache: false,
            beforeSend: () => $("#loaderHistory").addClass("active"),
            success: function(data) {
                $('#loaderHistory').removeClass("active");
                $('.modal-subtitle').html(productinfo);
                if (data.changes.length) {
                    data.changes.forEach(change => {
                        if (!change) return;
                        if (change.value_name === "Статус") {
                            change.value_old = change.value_old == 1 ? "Активно" : "Неактивно";
                            change.value_new = change.value_new == 1 ? "Активно" : "Неактивно";
                        }
                    $('.historyTable').append(`
                                            <tr>
                                                <td>${change.value_name}</td>
                                                <td>${change.data_change}</td>
                                                <td class="column_data">${change.value_old}</td>
                                                <td class="column_data">${change.value_new}</td>
                                                <td>${change.firstname ? change.firstname + " " + change.lastname : "Неизвестно"}</td>
                                            </tr>
                                        `);
                    });
                }
            },
                error: () => loadHistory(productid, productinfo)
            });
    }

    /**
     * Обновляет превью в ячейке #image-{id} после загрузки (без перезагрузки страницы).
     * Логика как в ModelCatalogProduct::addImageForProduct: первое фото при пустом main — большое, остальные — миниатюры 50px.
     */
    function refreshProductListImageCell(productId, files, folder) {
        const $td = $('#image-' + productId);
        if (!$td.length || !files.length) {
            return;
        }
        const baseImage = window.location.origin + '/image/';
        const $mainImg = $td.children('div').first().find('img.img-thumbnail');
        const hadNoMain = !$mainImg.length || /no_image/i.test($mainImg.attr('src') || '');

        files.forEach(function(file, index) {
            if (!file || !file.upload) {
                return;
            }
            const rel = folder + file.upload.filename;
            const href = baseImage + rel;
            const src = href + '?_=' + Date.now();

            if (index === 0 && hadNoMain) {
                const $wrap = $td.children('div').first();
                let $a = $wrap.find('a').first();
                let $img = $wrap.find('img.img-thumbnail').first();
                if ($img.length) {
                    $img.attr('src', src);
                    if ($a.length) {
                        $a.attr('href', href);
                    }
                } else {
                    $wrap.html(
                        '<a data-lightbox="image' + productId + '" href="' + href + '">' +
                        '<img src="' + src + '" width="150" class="img-thumbnail" data-id="' + productId + '" /></a>'
                    );
                }
            } else {
                $td.append(
                    '<a data-lightbox="image' + productId + '" href="' + href + '">' +
                    '<img src="' + src + '" width="50" class="img-thumbnail" data-id="' + productId + '" /></a>'
                );
            }
        });
    }

    // Dropzone
    Dropzone.options.dropzoneFrom = {
        autoProcessQueue: false,
        parallelUploads: 20,
        maxThumbnailFilesize: 2000,
        resizeWidth: 1200,
        timeout: 180000000,
        renameFile: file => Date.now() + '_' + file.name,
        init: function() {
            const myDropzone = this;
            $('#submit-all').on('click', () => myDropzone.processQueue());

            this.on("queuecomplete", function() {
                const ts = typeof window.PRODUCT_LIST_D4_IMG_TIME === 'number' ? window.PRODUCT_LIST_D4_IMG_TIME : 0;
                const folder = 'catalog/d4_img/' + ts + '/';
                const productId = $('#submit-all').data('productid');
                const files = myDropzone.files.filter(function(f) {
                    return f && f.upload;
                });

                if (!files.length) {
                    myDropzone.removeAllFiles();
                    $('#myModalBox').modal('hide');
                    return;
                }

                const requests = files.map(function(file) {
                    return $.post('index.php?route=catalog/product/addImageListPage&token=' + token, {
                        product_id: productId,
                        image: folder + file.upload.filename
                    });
                });

                $.when.apply($, requests).done(function() {
                    refreshProductListImageCell(productId, files, folder);
                    myDropzone.removeAllFiles();
                    $('#myModalBox').modal('hide');
                }).fail(function() {
                    alert('Не удалось сохранить изображения на сервере.');
                    myDropzone.removeAllFiles();
                });
            });
        }
    };

    // Печать QR
    $('body').on('click', '.printQrOuterLists', function() {
        const model = $(this).data('qrmodel');
        const title = $(this).data('titles');
        const frame = window.frames['imgFrame'];
        frame.document.write(`
                <html><head><style>@print{@page :footer {color: #fff }@page :header {color: #fff}}</style></head>
                <body onload="window.print()" style="font-family: Open Sans, sans-serif;">
                    <div style="margin:0 auto;display:flex;align-items:center;max-width:275px;border:1px solid #000;">
                        <div><img src="https://d4.by/gd/qr/${model}_main.png" style="width:110px;"></div>
                        <div style="text-align:center;font-size:12px;padding-left:10px;font-weight:bold;line-height:18px;">${title}</div>
                    </div>
                </body></html>
            `);
        frame.document.close();
    });

    // Избранное
    $('body').on('click', '.status_favourite', function() {
        const id = $(this).data('id');
        const el = $(this);
        $.post(`index.php?route=catalog/product/actions&token=${token}&actions=${id}`, {
            actions: id
        }, function(response) {
            const active = response === '1';
            el.text(active ? 'Активно' : 'Неактивно')
            .css({ color: '#000', background: active ? '#23b423' : 'red', fontWeight: 'bold' });
        });
    });

    // Обновление стилей каждые 500 мс
    setInterval(() => {
        $('.status_qe').each(function() {
        const el = $(this);
        const isActive = el.text() === "Активно";
        el.css({ background: isActive ? '#23b423' : 'red', color: '#000', fontWeight: 'bold' });
    });
    }, 500);

    // Инициализация селектов
    $('.same_pick').selectpicker();

    function resetDiskExtras() {
        const $extras = $('#disk-filter-extras');
        if (!$extras.length) return;

        $extras.find('select').val('');
        $extras.find('input').val('');

        $extras.find('select.selectpicker, select.same_pick').each(function() {
            try { $(this).selectpicker('refresh'); } catch (e) {}
        });

        $extras.hide();
    }

    // Обработка кнопки "очистить"
    $(document).on('click', '.select2-selection__clear', function() {
        const $th = $(this).closest('th');

        // Clear selects inside this filter cell (manufacturer/category/etc)
        $th.find('select').each(function() {
            $(this).val('');
            try { $(this).selectpicker('refresh'); } catch (e) {}
            $(this).trigger('change');
        });

        // Clear any inputs inside this filter cell
        $th.find('input').each(function() {
            $(this).val('');
            $(this).trigger('input');
            $(this).trigger('change');
        });

        // Special case: manufacturer filter also controls disk extras
        if ($th.find('#filter-manufacturer-select').length) {
            resetDiskExtras();
        }
    });

    // Разделение запятых на новые строки
    $('.sku_qe_br').each(function () {
        $(this).text($(this).text().replace(/,/g, ",\n"));
    });
});
