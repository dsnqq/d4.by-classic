<?php echo $header; ?>

<?php $isCity = false; ?>

<div id="content">
    <div class="container">
        <ul class="breadcrumb">
            <?php
                $i = 0;
                $count = count($breadcrumbs);
            ?>
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <?php
                    $i++;
                    if ($i != $count) {
                ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } else { ?>
                    <li style="font-size: 14px;line-height: 20px;color: #8D9293;text-decoration: none;"><?php echo $breadcrumb['text']; ?></li>
                <?php } ?>
            <?php } ?>
        </ul>
        <div class="wrapper_product_page product-modern" id="product">
            <div class="left_product_page">
                <h1 class="left_product_page_t">
                    <?php echo $marka; ?> <?php echo $model_s; ?> <b><?php echo $shirina; ?>/<?php echo $vysota; ?> <?php echo $r_size; ?></b>, <?php echo $quantity; ?> шт., <?php echo $season; ?>, <?php echo $sostojan; ?>
                </h1>
                <div class="product_info_page_g">
                    <div class="thamb_images_product">
                        <?php
                            $product_gallery = array();
                            if (!empty($thumb)) {
                                $product_gallery[] = array('thumb' => $thumb, 'popup' => $popup);
                            }
                            if (!empty($images)) {
                                foreach ($images as $image) {
                                    $product_gallery[] = array(
                                        'thumb' => !empty($image['thumb']) ? $image['thumb'] : $image['popup'],
                                        'popup' => $image['popup']
                                    );
                                }
                            }
                        ?>
                        <?php if ($product_gallery) { ?>
                        <div class="product-gallery-slider carousel_image_thumb">
                            <?php foreach ($product_gallery as $gi => $gimg) { ?>
                            <div class="product-gallery-slide">
                                <div class="product-gallery-slide-inner"<?php if ($gi === 0) { ?> itemscope itemtype="http://schema.org/ImageObject"<?php } ?>>
                                    <a href="<?php echo $gimg['popup']; ?>" class="MagicZoom" data-gallery="product-gallery-mz" data-options="zoomMode: off; hint: off; expand: window; expandZoomMode: off">
                                        <img src="<?php echo $gimg['thumb']; ?>" title="<?php echo htmlspecialchars($heading_title, ENT_QUOTES, 'UTF-8'); ?>" alt="<?php echo htmlspecialchars($heading_title, ENT_QUOTES, 'UTF-8'); ?>"<?php if ($gi === 0) { ?> itemprop="contentUrl"<?php } ?> />
                                    </a>
                                </div>
                            </div>
                            <?php } ?>
                        </div>
                        <?php } ?>
                    </div>
                    <div class="product_info_y">

                        <ul>
                            <li><span>Год: </span><span><?php echo $year; ?></span></li>
                            <li><span>Артикул: </span><span><?php echo $model; ?></span></li>
                            <?php if($jan){ ?>
                            <li><span>Ширина: </span><span><?php echo $jan; ?></span></li>
                            <?php } ?>
                            <?php if($isbn){ ?>
                            <li><span>Радиус: </span><span><?php echo $isbn; ?> <?php if($mpn){ echo $mpn; } ?></span></li>
                            <?php } ?>
                            <?php if($sku){ ?>
                            <li><span>Сезон: </span><span><?php echo $sku; ?></span></li>
                            <?php } ?>
                            <?php if($ean){ ?>
                            <li><span>Марка: </span><span><?php echo $ean; ?></span></li>
                            <?php } ?>
                            <?php if($upc != "" && $upc){ ?>
                            <li><span>Модель: </span><span><?php echo $upc; ?></span></li>
                            <?php } ?>

                            <?php if($location != ""){ ?>
                            <li><span>Состояние: </span><span><?php echo $location; ?></span></li>
                            <?php } ?>


                            <?php if ($attribute_groups) { ?>
                            <?php foreach ($attribute_groups as $attribute_group) { ?>
                            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                            <?php if($attribute['name'] != "Телефон, если другой" && $attribute['name'] != "Заметка" && $attribute['name'] != "Складская информация (заметка)" && $attribute['name'] != "Город"){ ?>
                            <li><span><?php echo $attribute['name']; ?>: </span><span><?php echo $attribute['text']; ?></span></li>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>
                        </ul>
                        <div class="price_product_add">
                            <?php if($special != ""){ ?>
                            <div class="price_product_add1">Цена: <span style="color:red;"><?php echo $special; ?></span><div style="text-decoration:line-through;"><?php echo $price; ?></div></div>
                            <?php } else{ ?>
                            <div class="price_product_add1">Цена: <?php echo $price; ?></div>
                            <?php } ?>

                        <div class="form-group">
                            <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" style="display:none;"/>
                            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                            <button type="button" class="btn_add_carte" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
            <div class="product_this__time"><img src="/catalog/view/theme/d4/images/time.svg" title="time" alt="images-time"><?php echo date_format($datetime1, "d.m.Y");?></div>
            <?php if($description){ ?>
            <div class="product_this_desc"><div class="block_white_t">Описание:</div><?php echo $description; ?></div>
            <?php } ?>
            <div class="product_share">
                Поделиться с другом:
                <script src="https://yastatic.net/es5-shims/0.0.2/es5-shims.min.js"></script>
                <script src="https://yastatic.net/share2/share.js"></script>
                <div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,moimir,twitter,viber,whatsapp,skype,telegram"></div>
            </div>
        </div>
        <div class="right_product_page">
            <div class="user-detail-action mb30">
                <div class="ytrewqq">
                    <a class="btn btn-danger btn-block btn-phone" href="tel:+375(29)641-64-96">
                        +375 (29) 641-64-96
                    </a>
                    <div class="text-center">
                        <a class="button-messangers mobiles" href=" viber://add?number='375296416496">Viber</a>
                        <a class="button-messangers desktoper" href="viber://chat?number=+375296416496">Viber</a>
                    </div>
                    <div style="clear:both; margin-bottom: 5px;"></div>
                    <a class="btn btn-danger btn-block btn-phone" href="tel:+375(29)800-07-36">
                        +375 (29) 800-07-36
                    </a>
                    <div class="text-center">
                        <a class="button-messangers mobiles" href=" viber://add?number='375298000736">Viber</a>
                        <a class="button-messangers desktoper" href="viber://chat?number=+375298000736">Viber</a>
                        <a class="button-messangers" href="https://wa.me/+375298000736">WhatsApp</a>
                        <a class="button-messangers" href="tg://resolve?domain=+375298000736">Telegram</a>
                    </div>
                    <div style="clear:both; margin-bottom: 5px;"></div>
                    <a class="btn btn-danger btn-block btn-phone" href="tel:+375(29)795-26-40">
                        +375 (29) 795-26-40
                    </a>
                    <div class="text-center">
                        <a class="button-messangers mobiles" href=" viber://add?number='375297952640">Viber</a>
                        <a class="button-messangers desktoper" href="viber://chat?number=+375297952640">Viber</a>
                        <a class="button-messangers" href="https://wa.me/+375297952640">WhatsApp</a>
                        <a class="button-messangers" href="tg://resolve?domain=+375297952640">Telegram</a>
                    </div>
                    <div style="clear:both; margin-bottom: 5px;"></div>
                </div>

                <?php if ($attribute_groups) { ?>
                <?php foreach ($attribute_groups as $attribute_group) { ?>
                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                <?php if($attribute['name'] == "Телефон, если другой" && $attribute['text'] != ""){ ?>
                <?php
											$attribute__phone = explode(';',$attribute['text']);
											//$attribute__phone = explode(',',$attribute['text']);
										?>
                <?php foreach($attribute__phone as $attribute__phone__item){ ?>
                <?php
							$viber_status = false;
							$whatsapp_status = false;
							$telegram_status = false;
						  ?>
                <?php
							if(strpos(trim($attribute__phone__item), 'Viber') !== false) {
								$viber_status = true;
								$attribute__phone__item = str_replace('Viber','',$attribute__phone__item);
							}
							if(strpos(trim($attribute__phone__item), 'WhatsApp') !== false) {
								$whatsapp_status = true;
								$attribute__phone__item = str_replace('WhatsApp','',$attribute__phone__item);
							}
							if(strpos(trim($attribute__phone__item), 'Telegram') !== false) {
								$telegram_status = true;
								$attribute__phone__item = str_replace('Telegram','',$attribute__phone__item);
							}
						?>
                <a class="btn btn-danger btn-block btn-phone" href="tel:<?php echo $item[0]; ?>">
                    <?php echo $attribute__phone__item; ?>
                </a>
                <?php $phone = preg_replace('/[^0-9]/', '', $attribute__phone__item); ?>
                <div class="text-center">
                    <?php if($viber_status == true){ ?>
                    <a class="button-messangers mobiles" href=" viber://add?number='<?php echo $phone; ?>">Viber</a>
                    <a class="button-messangers desktoper" href="viber://chat?number=+<?php echo $phone; ?>">Viber</a>
                    <?php } ?>
                    <?php if($whatsapp_status == true){ ?>
                    <a class="button-messangers" href="https://wa.me/<?php echo $phone; ?>">WhatsApp</a>
                    <?php } ?>
                    <?php if($telegram_status == true){ ?>
                    <a class="button-messangers" href="tg://resolve?domain=<?php echo $phone; ?>">Telegram</a>
                    <?php } ?>
                </div>
                <div style="clear:both; margin-bottom: 5px;"></div>
                <?php } ?>
                <style>
                    .ytrewqq{display:none !important;}
                </style>
                <?php } ?>
                <?php } ?>
                <?php } ?>
                <?php } ?>

            </div>


            <div class="block_white mb30">
                <div class="block_white_t">Время работы</div>
                <?php
			$timeNow = date('H:i');
			$dayNum  = date("N");
			$timeNow = (string)$timeNow;
		?>
                <div class="seller-info">
                    <div class="offices-time dropdown">
                        <div class="offices-time_btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="/catalog/view/theme/d4/images/time.svg">
                            <?php if($dayNum <= 6){ // ПН-СБ ?>
                            <?php
						$opening_hours = '9:00 - 18:00';
						$opening_start = trim(explode('-', $opening_hours)[0]);
						$opening_start_hours = explode(':', $opening_start)[0];
						$opening_start_minutes = explode(':', $opening_start)[1];
						$opening_start_today = $opening_start_hours * 60 + $opening_start_minutes;
						$opening_end = trim(explode('-', $opening_hours)[1]);
						$opening_end_hours = explode(':', $opening_end)[0];
						$opening_end_minutes = explode(':', $opening_end)[1];
						$opening_end_today = $opening_end_hours * 60 + $opening_end_minutes;
						if ($opening_end_today <= $opening_start_today) $opening_end_today = 24 * 60 + $opening_end_today;
						$zone = 'Europe/Minsk';
						$now = new DateTime('now', new DateTimeZone($zone));
						$now_hours = $now->format('H');
                            $now_minutes = $now->format('i');
                            $now_today = $now_hours * 60 + $now_minutes;
                            if ($now_today > $opening_start_today && $now_today < $opening_end_today) {
                            ?>
                            <span class="green">Открыто до 18:00</span>
                            <?php
						} else {
						?>
                            <span class="red">Закрыто до 9:00</span>
                            <?php
						}
					?>
                            <?php } else{ // ВСК?>
                            <?php
						$opening_hours = '9:00 - 13:00';
						$opening_start = trim(explode('-', $opening_hours)[0]);
						$opening_start_hours = explode(':', $opening_start)[0];
						$opening_start_minutes = explode(':', $opening_start)[1];
						$opening_start_today = $opening_start_hours * 60 + $opening_start_minutes;
						$opening_end = trim(explode('-', $opening_hours)[1]);
						$opening_end_hours = explode(':', $opening_end)[0];
						$opening_end_minutes = explode(':', $opening_end)[1];
						$opening_end_today = $opening_end_hours * 60 + $opening_end_minutes;
						if ($opening_end_today <= $opening_start_today) $opening_end_today = 24 * 60 + $opening_end_today;
						$zone = 'Europe/Minsk';
						$now = new DateTime('now', new DateTimeZone($zone));
						$now_hours = $now->format('H');
                            $now_minutes = $now->format('i');
                            $now_today = $now_hours * 60 + $now_minutes;
                            if ($now_today > $opening_start_today && $now_today < $opening_end_today) {
                            ?>
                            <span class="green">Открыто до 13:00</span>
                            <?php
						} else {
						?>
                            <span class="red">Закрыто до 10:00</span>
                            <?php
						}
					?>
                            <?php } ?>
                        </div>
                        <div class="offices-time_menu dropdown-menu">
                            <div class="offices-time_title">Время работы</div>
                            <ul class="offices-time_list">
                                <li class="item">
                                    <div class="name"><span>Пн</span></div>
                                    <div class="data">
                                        9:00 – 18:00 </div>
                                </li>
                                <li class="item">
                                    <div class="name"><span>Вт</span></div>
                                    <div class="data">
                                        9:00 – 18:00 </div>
                                </li>
                                <li class="item">
                                    <div class="name"><span>Ср</span></div>
                                    <div class="data">
                                        9:00 – 18:00 </div>
                                </li>
                                <li class="item">
                                    <div class="name"><span>Чт</span></div>
                                    <div class="data">
                                        9:00 – 18:00 </div>
                                </li>
                                <li class="item">
                                    <div class="name"><span>Пт</span></div>
                                    <div class="data">
                                        9:00 – 18:00 </div>
                                </li>
                                <li class="item">
                                    <div class="name"><span>Сб</span></div>
                                    <div class="data">
                                        9:00 – 18:00 </div>
                                </li>
                                <li class="item">
                                    <div class="name"><span>Вск</span></div>
                                    <div class="data">
                                        10:00 – 13:00 </div>
                                </li>
                            </ul>
                        </div>
                    </div>


                    <?php if ($attribute_groups) { ?>
                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                    <?php if($attribute['name'] == "Город" && $attribute['text'] != ""){ ?>
                    <?php $isCity = true; ?>
                    <p>Адрес: <b><?php echo $attribute['text']; ?></b></p>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                    <?php if ($isCity == false) { ?>
                    <p>Адрес: <b>Дрогичин, Заводская 20</b></p>
                    <?php } ?>

                    <p class="hidden">
                        <b>E-mail:</b>
                        <a href="mailto:info@d4.by"><i class="fa fa-envelope"></i></a> info@d4.by </p>
                </div>
            </div>
            <?php echo $column_right; ?>
        </div>
    </div>

</div>

<?php echo $content_bottom; ?>

<div class="overlay_form">
    <div class="modal_flex">
        <img src="/catalog/view/theme/d4/images/closesin.png" alt="closesin" class="closesinh">
        <div class="title_flex">Заказать</div>
        <form id="formCalling">
            <div class=" mt_form40">
                <input autocomplete="off" type="text" class="dynamic-label-input" required="" name="name">
                <div class="placeholder" data-input="Ваше имя*">Ваше имя*</div>
            </div>
            <div class=" mt_form40">
                <input autocomplete="off" type="text" class="dynamic-label-input" required="" name="phone">
                <div class="placeholder" data-input="Телефон*">Телефон*</div>
            </div>
            <div class="btn_calling">Отправить</div>
        </form>
    </div>
</div>
<script type='application/ld+json'>
{
  "@context": "http://www.schema.org",
  "@type": "Product",
  "brand": {
        "@type": "Brand",
        "name": "D4.by"
      },
  "name": "<?php echo $manufacturer; ?> к <?php echo $catprod2[0]['name']; ?> <?php echo $catprod[0]['name']; ?>, <?php echo $year; ?>г.",
  "image": "<?php echo $thumb; ?>",
  "description": "<?php echo strip_tags($description); ?>",
  "sku":"<?php echo $sku; ?>",
  "mpn":"<?php echo $model; ?>",
   "offers":
	{"@type":"AggregateOffer",
    "priceCurrency":"<?php echo substr($price, -3, 3); ?>",
    "lowPrice":"<?php echo substr($price, 0, -4); ?>",
    "offerCount":"1",
    "itemCondition":"https://schema.org/UsedCondition",
    "availability":"https://schema.org/InStock",
    "seller":{"@type":"Organization","name":"D4.by"}},
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.9",
    "reviewCount": "50"
  },
  "review":{"@type":"Review","author":{"@type":"Person", "name": "D4.by"}}
}
 </script>

<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function() {
                $('#recurring-description').html('');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--
    $('#button-cart').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('#button-cart').button('loading');
            },
            complete: function() {
                $('#button-cart').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

                    $('html, body').animate({ scrollTop: 0 }, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //--></script>
<script type="text/javascript"><!--


    $('button[id^=\'button-upload\']').on('click', function() {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function() {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $(node).button('loading');
                    },
                    complete: function() {
                        $(node).button('reset');
                    },
                    success: function(json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').val(json['code']);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript"><!--
    $('#review').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function() {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function() {
                $('#button-review').button('loading');
            },
            complete: function() {
                $('#button-review').button('reset');
            },
            success: function(json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
        grecaptcha.reset();
    });
    /*
    $(document).ready(function() {
        $('.thumbnails').magnificPopup({
            type:'image',
            delegate: 'a',
            gallery: {
                enabled:true
            }
        });
    });*/

function productGalleryMagicZoomRefresh() {
    if (typeof MagicZoom === 'undefined' || !MagicZoom.refresh) {
        return;
    }
    try {
        MagicZoom.refresh();
    } catch (e) {
    }
}

$(document).ready(function() {
    var $pg = $('.product-modern .product-gallery-slider');
    if ($pg.length && $pg.children('.product-gallery-slide').length) {
        if ($pg.hasClass('slick-initialized')) {
            $pg.slick('unslick');
        }
        var slideCount = $pg.children('.product-gallery-slide').length;
        $pg.slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: true,
            dots: slideCount > 1,
            infinite: slideCount > 1,
            adaptiveHeight: true,
            swipe: true,
            touchMove: true,
            draggable: true,
            swipeToSlide: true,
            touchThreshold: 8,
            prevArrow: '<button type="button" class="product-gallery-arrow product-gallery-prev" aria-label="Предыдущее фото"></button>',
            nextArrow: '<button type="button" class="product-gallery-arrow product-gallery-next" aria-label="Следующее фото"></button>'
        });
        $pg.on('afterChange', function() {
            setTimeout(productGalleryMagicZoomRefresh, 80);
        });
        if (document.readyState === 'complete') {
            setTimeout(productGalleryMagicZoomRefresh, 100);
        } else {
            $(window).on('load', function() {
                setTimeout(productGalleryMagicZoomRefresh, 100);
            });
        }
    }
});

    $(document).ready(function() {
        var hash = window.location.hash;
        if (hash) {
            var hashpart = hash.split('#');
            var  vals = hashpart[1].split('-');
            for (i=0; i<vals.length; i++) {
                $('#product').find('select option[value="'+vals[i]+'"]').attr('selected', true).trigger('select');
                $('#product').find('input[type="radio"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
                $('#product').find('input[type="checkbox"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
            }
        }
    })
    //--></script>
</div>
<style>
    .btn.btn-danger{
        background-color: #E74C3C;
        color: #FFFFFF;
        display: block;
        width: 100%;
        text-align: center;
        text-decoration: none;
        border-radius: 3px;
        padding: 10px 0;
    }
    .button-messangers {
        width: 30%;
        background: #94280d;
        color: white;
        padding: 4px;
        display: block;
        float: left;
        border: 1px solid white;
        text-align: center;
        text-decoration: none;
    }
    .mobiles{display:none;}
    @media screen and (max-width: 1024px) {
        .desktoper{display:none;}
        .mobiles{display:inline-block;}
        .user-detail-action{
            margin-top: 30px;
        }
    }
</style>
<?php echo $footer; ?>
