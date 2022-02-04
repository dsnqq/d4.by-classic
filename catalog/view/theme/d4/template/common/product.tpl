<?php echo $header; ?>
<div id="content">
<div class="container">
  <ul class="breadcrumb">
	<?php 
		$i=0;
		$count = count($breadcrumbs);
	?>
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php
			$i++;
			if ($i != $count) {	
		?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } else{ ?>
			<li style="font-size: 14px;line-height: 20px;color: #8D9293;text-decoration: none;"><?php echo $breadcrumb['text']; ?></li>
		<?php } ?>
    <?php } ?>
  </ul>
  <div class="wrapper_product_page" id="product">
      <div class="left_product_page">
        <h1 class="left_product_page_t"><?php echo $manufacturer; ?> к <?php echo $catprod2[0]['name']; ?> <?php echo $catprod[0]['name']; ?>, <?php echo $year; ?>г.</h1>
        <div class="product_info_page_g">
          <div class="thamb_images_product">
            <div class="main_img_j"itemscope itemtype="http://schema.org/ImageObject">
            <?php if ($thumb || $images) { ?>
              <div class = "wrap_thumbnails">
                <?php if ($thumb) { ?>
                  <a id = "gallery_zoom" href="<?php echo $popup; ?>" class="MagicZoom" data-options="zoomPosition: inner"><img src="<?php echo $popup; ?>" title="<?php echo $manufacturer; ?> к <?php echo $catprod2[0]['name']; ?> <?php echo $catprod[0]['name']; ?>" alt="<?php echo $manufacturer; ?> к <?php echo $catprod2[0]['name']; ?> <?php echo $catprod[0]['name']; ?>" itemprop="contentUrl" /></a>
                <?php } else{ ?>
					<a id = "gallery_zoom" href="<?php echo $popup; ?>" class="MagicZoom" data-options="zoomPosition: inner"><img src="<?php echo $popup; ?>" title="<?php echo $manufacturer; ?> к <?php echo $catprod2[0]['name']; ?> <?php echo $catprod[0]['name']; ?>" alt="<?php echo $manufacturer; ?> к <?php echo $catprod2[0]['name']; ?> <?php echo $catprod[0]['name']; ?>" itemprop="contentUrl" /></a>
				<?php } ?>
                </ul>
              </div>
              <?php } ?>
            </div>
            <div class="thumb_j">
              <div class = "carousel_image_thumb">
                <?php if ($thumb || $images) {  ?>
                  <?php if ($thumb) { ?>
                    <div class = "wrap_thumb_img">
                    <a data-zoom-id = "gallery_zoom" href = "<?php echo $popup; ?>"><img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"  class="wrap_thumb_img_pars"/></a>
                    </div>
                  <?php } ?>
                  <?php if ($images) { ?>
                    <?php foreach ($images as $image) { ?>
                      <div class = "wrap_thumb_img">
                        <a data-zoom-id = "gallery_zoom" href = "<?php echo $image['popup']; ?>"><img src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"  class="wrap_thumb_img_pars"/></a>
                      </div>
                    <?php } ?>
                  <?php } ?>
                <?php } ?>
              </div> 
            </div>
          </div>
          <div class="product_info_y">
              <div class="product_info_y__stay">
                <span class="ytrewqq" style="font-size:18px;"><span style="font-size:14px;">Телефон:</span>
				<br>+375 (29) 641-64-96
				<br>+375 (29) 795-36-19
				<br>+375 (29) 800-07-36
				</span>
				<?php if ($attribute_groups) { ?>
					<?php foreach ($attribute_groups as $attribute_group) { ?>
						<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							<?php if($attribute['name'] == "Телефон, если другой" && $attribute['text'] != ""){ ?>
								<?php $attribute__phone = explode(';',$attribute['text']);?>
									<span style="font-size:16px;">
										<span style="font-size:14px;">Телефон:</span><br>
										<?php foreach($attribute__phone as $attribute__phone__item){ ?>
											<?php echo trim($attribute__phone__item); ?><br>
										<?php } ?>
									</span>
								<style>
									.ytrewqq{display:none !important;}
								</style>
							<?php } ?>
						<?php } ?>
					<?php } ?>
				<?php } ?>
              </div>
              <ul>
                  <li><span>Марка: </span><span><?php echo $catprod2[0]['name']; ?></span></li>
                  <li><span>Модель: </span><span><?php echo $catprod[0]['name']; ?></span></li>
                  <li><span>Запчасть: </span><span><?php echo $manufacturer; ?></span></li>
                  <li><span>Год: </span><span><?php echo $year; ?></span></li>
                  <li><span>Артикул: </span><span><?php echo $model; ?></span></li>
				  <?php if($jan){ ?>
                  <li><span>Объем: </span><span><?php echo $jan; ?></span></li>
				  <?php } ?>
				  <?php if($isbn){ ?>
                  <li><span>Тип топлива: </span><span><?php echo $isbn; ?> <?php if($mpn){ echo $mpn; } ?></span></li>
				  <?php } ?>
				  <?php if($sku){ ?>
                  <li><span>Номер запчасти: </span><span><?php echo $sku; ?></span></li>
				  <?php } ?>
				  <?php if($ean){ ?>
                  <li><span>Тип кузова: </span><span><?php echo $ean; ?></span></li>
				  <?php } ?>
				  <?php if($upc != "" && $upc){ ?>
                  <li><span>Коробка: </span><span><?php echo $upc; ?></span></li>
				  <?php } ?>
				  
				<?php if($location != ""){ ?>
                  <li><span>Диаметр R, дюймы: </span><span><?php echo $location; ?></span></li>
				  <?php } ?>
				<?php if($width != "" && $width != 0){ ?>
                  <li><span>Ширина J, дюймы: </span><span><?php echo $width; ?></span></li>
				  <?php } ?>
				<?php if($height != "" && $height != 0){ ?>
                  <li><span>Кол-во отверстий: </span><span><?php echo $height; ?></span></li>
				  <?php } ?>
				<?php if($weight != "" && $weight != 0){ ?>
                  <li><span>Расстояние между отверстиями PCD, мм: </span><span><?php echo $weight; ?></span></li>
				  <?php } ?>
				<?php if($etvylet != "" && $etvylet != 0){ ?>
                  <li><span>Вылет ET, мм: </span><span><?php echo $etvylet; ?></span></li>
				  <?php } ?>
				<?php if($diadiametr != "" && $diadiametr != 0){ ?>
                  <li><span>Диаметр центрального отверстия DIA, мм: </span><span><?php echo $diadiametr; ?></span></li>
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
                  <!----<div class="price_product_add_flex">
                    <div class="price_product_add2">~<?php echo $price_2; ?></div>
                    <div class="price_product_add2">~<?php echo $price_3; ?></div>
                  </div>--->
                  <?php /*<div class="btn_add_carte">Купить</div>*/ ?>
				  
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
					<span class="green">Открыто до 18:00</span>
				<?php } else{ // ВСК?>
					<span class="green">Открыто до 13:00</span>
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
			<p>Адрес: <b>Дрогичин, Заводская 20</b></p>
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
<script>
	$('.carousel_image_thumb').slick({
		infinite: true,
		slidesToShow: 5,
		slidesToScroll: 1
	});
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
<?php echo $footer; ?>
