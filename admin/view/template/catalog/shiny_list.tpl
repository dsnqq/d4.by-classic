<?php echo $header; ?><?php echo $column_left; ?>
<?php require_once $_SERVER['DOCUMENT_ROOT'].'/admin/shiny_config.php';?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">

          <?php if( $user_id_com != 25 ){ ?>
          <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <?php /*<button type="submit" form="form-product" formaction="<?php echo $copy; ?>" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="btn btn-default"><i class="fa fa-copy"></i></button>*/?>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product').submit() : false;"><i class="fa fa-trash-o"></i></button>
        <?php } ?>

      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well " >
          <div class="row">
            <div class="form-group ">
                <?php /* Ширина */ ?>
                <label class="col-md-2 col-xs-4 control-label" for="input-jan" style="font-weight:bold;">Ширина *, высота *, R * </span></label>
                <div class="col-sm-2 padding-r-2">
                  <select id="main__jan" name="jan" class="form-control selectpicker" data-live-search="true">
                        <option value="*" <?php echo ($filter_shirina == "") ? "selected='selected'" : "" ; ?>>Ширина *</option>
                        <?php foreach($width_shiny as $width_shiny_item){ ?>
                          <option value="<?php echo $width_shiny_item; ?>" <?php echo ($width_shiny_item == $filter_shirina) ? "selected='selected'" : "" ; ?>><?php echo $width_shiny_item; ?></option>
                        <?php } ?>
                  </select>
                </div>

                <?php /* Высота */ ?>
                <div class="col-sm-2 padding-l-r-2">
                  <select id="main__isbn" name="isbn" class="form-control selectpicker" data-live-search="true">
                        <option value="*" <?php echo ($filter_vysota == "") ? "selected='selected'" : "" ; ?>>Высота *</option>
                        <?php foreach($height_shiny as $height_shiny_item){ ?>
                          <option value="<?php echo $height_shiny_item; ?>" <?php echo ($height_shiny_item == $filter_vysota) ? "selected='selected'" : "" ; ?>><?php echo $height_shiny_item; ?></option>
                        <?php } ?>
                  </select>
                </div>

                <?php /* R */ ?>
                <div class="col-sm-2 padding-l-r-2">
                  <select id="main__mpn" name="mpn" class="form-control selectpicker" data-live-search="true">
                        <option value="*" <?php echo ($filter_r == "") ? "selected='selected'" : "" ; ?>>R *</option>
                        <?php foreach($location_array as $location_array_item){ ?>
                          <option value="<?php echo $location_array_item; ?>" <?php echo ($location_array_item == $filter_r) ? "selected='selected'" : "" ; ?>><?php echo $location_array_item; ?></option>
                        <?php } ?>
                  </select>
                </div>
            </div>
            <?php /* Марка */ ?>
            <div class="form-group ">
                <label class="col-md-2 col-xs-4 control-label" style="font-weight:bold;">Марка *, модель </label>
                <div class="col-sm-2  padding-r-2">
                  <select id="ean_main" name="ean" class="form-control selectpicker" data-live-search="true">
                        <option value="*" <?php echo ($filter_ean == "") ? "selected='selected'" : "" ; ?>>Марка *</option>
                        <?php foreach($marka_shiny as $marka_shiny_item){ ?>
                          <option value="<?php echo $marka_shiny_item; ?>" <?php echo ($marka_shiny_item == $filter_ean) ? "selected='selected'" : "" ; ?>><?php echo $marka_shiny_item; ?></option>
                        <?php } ?>
                  </select>
                </div>

                <?php /* модель */ ?>
                <div class="col-sm-2 padding-l-r-2">
                    <input type="text" name="upc" value="<?php echo $upc; ?>" placeholder="Модель" id="input-upc" class="form-control" />
                </div>
            </div>

            <div class="form-group ">
                <label class="col-md-2 col-xs-4 control-label" style="font-weight:bold;"> Состояние *, сезон *, количество *</label>

                <?php /* Состояние */ ?>
                <div class="col-sm-2">
                  <select id="location_select" name="location" class="form-control selectpicker" data-live-search="true">
                        <option value="*" <?php echo ($filter_location == "") ? "selected='selected'" : "" ; ?>>Состояние *</option>
                        <?php foreach($sostojanije as $sostojanije_item){ ?>
                          <option value="<?php echo $sostojanije_item; ?>" <?php echo ($sostojanije_item == $filter_location) ? "selected='selected'" : "" ; ?>><?php echo $sostojanije_item; ?></option>
                        <?php } ?>
                  </select>
                </div>

                <?php /* Сезон */ ?>
                <div class="col-sm-2 padding-l-r-2">
                  <select id="sku_season" name="sku" class="form-control selectpicker" data-live-search="true">
                        <option value="*" <?php echo ($sku_season == "") ? "selected='selected'" : "" ; ?>>Сезон *</option>
                        <?php foreach($season as $season__item){ ?>
                          <option value="<?php echo $season__item; ?>" <?php echo ($season__item == $sku_season) ? "selected='selected'" : "" ; ?>><?php echo $season__item; ?></option>
                        <?php } ?>
                  </select>
                </div>

                <?php /* Количество */ ?>
                <div class="col-sm-2">
                    <input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
                </div>

            </div>

            <?php /* Тип авто, год выпуска шин */ ?>
            <div class="form-group">
                <label class="col-md-2 col-xs-4 control-label">Тип авто, год выпуска шин</label>
                <div class="col-sm-2  padding-r-2">
                  <select id="version" name="version" class="form-control selectpicker" data-live-search="true">
                        <option value="*" <?php echo ($version == "") ? "selected='selected'" : "" ; ?>>Тип авто</option>
                        <?php foreach($versions as $version_item){ ?>
                          <option value="<?php echo $version_item; ?>" <?php echo ($version_item == $version) ? "selected='selected'" : "" ; ?>><?php echo $version_item; ?></option>
                        <?php } ?>
                  </select>
                </div>

                <?php /* модель */ ?>
                <div class="col-sm-2 padding-l-r-2">
                  <select id="length" name="length" class="form-control selectpicker" data-live-search="true">
                        <option value="*" <?php echo (round((float)$length, 2) == "") ? "selected='selected'" : "" ; ?>>Выберите год</option>
                        <?php $year_max = date('Y');$year_max = (int)$year_max; ?>
                        <?php for($year_iteration = 1980; $year_iteration <= $year_max; $year_iteration++){ ?>
                          <option value="<?php echo $year_iteration; ?>"  <?php echo (round((float)$length, 2) == $year_iteration) ? "selected='selected'" : "" ; ?>><?php echo $year_iteration; ?></option>
                        <?php } ?>
                  </select>
                </div>
            </div>
              <div class="form-group ">
                <label class="col-md-2 col-xs-4 control-label" for="input-model"><?php echo $entry_model; ?></label>
                <div class="col-sm-3">
                  <input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
                  <?php if ($error_model) { ?>
                  <div class="text-danger"><?php echo $error_model; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-md-2 col-xs-4 control-label">Статус</label>
                <div class="col-sm-2  padding-r-2">
                  <select id="status_filter" name="status_filter" class="form-control selectpicker">
                        <option value="" <?php echo ($status_filter == "") ? "selected='selected'" : "" ; ?>>Все</option>
                        <option value="true" <?php echo ($status_filter == "true") ? "selected='selected'" : "" ; ?>>Активно</option>
                        <option value="false" <?php echo ($status_filter == "false") ? "selected='selected'" : "" ; ?>>Неактивно</option>
                  </select>
                </div>
              </div>

              <?php /* Цена */ ?>
              <div class="form-group">
                <label class="col-md-2 col-xs-4 control-label">Цена</label>
                <div class="col-sm-2  padding-r-2">
                  <input type="text" name="price" value="<?php echo $price; ?>" placeholder="" id="input-price" class="form-control" />
                </div>
              </div>

              <button type="button" id="button-filter" class="btn btn-success btn-lg" style="margin-left: 15px;"><i class="fa fa-filter"></i> Поиск</button>
              <button type="button" id="button-clear" class="btn btn-warning btn-lg" style="margin-left: 15px;"><i class="fa fa-filter"></i> Сбросить</button>
          </div>
        </div>
        <div style="padding:15px 0px;">
          <span>Найдено объявлений: </span>
            <span style="font-size: 18px;font-weight: bold;line-height: 39px;">
                <?php echo $product_total_count; ?> штук
			<span>
            (<span style="color:green;">активные: <?php $shiny_acrive = (int)$product_total_count - (int)$product_total_count_status_no; echo $shiny_acrive; ?></span>, <span style="color:red;">неактивные: <?php echo $product_total_count_status_no; ?></span>)</span>
            </span>
        </div>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
          <div class="table-responsive">
          <table class="table">
            <thead>
              <tr class="alert-warning">
                <th>
                  <input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" />
                </th>
                <th width="300px">Марка и модель</th>
                <th title="Описание, складская информация">Описание, cклад.инфо, фото</th>
                <th>Цена за штуку</th>
                <th title="Дата подачи объявления"><i class="fa fa-calendar"></i></th>
                <th title="Активно/Не активно"><i class="fa fa-check-circle-o fa-lg"></i></th>
                <th>Действия</th>
              </tr>
            </thead>
            <?php /* ONE SHINY START */ ?>
            <?php if ($products) { ?>
                <?php foreach ($products as $product) { ?>
                <tr>
                  <td class="td-vertical-middle">
                    <?php if (in_array($product['product_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
                    <?php } ?>
                  </td>
                  <td>
                    <?php echo $product['marka']; ?> <?php echo $product['model_s']; ?> <b><?php echo $product['shirina']; ?>/<?php echo $product['vysota']; ?> <?php echo $product['r_size']; ?></b>, <?php echo $product['quantity']; ?> шт., <?php echo $product['season']; ?>, <?php echo $product['sostojan']; ?>
                     <?php if($product['length'] && $product['length'] != 0){ ?>
					<br>
					<span class="grey">Год: <?php echo $product['length']; ?></span>
					<?php } ?>
					<br>
                    <span class="grey">Артикул: <?php echo $product['model']; ?></span>
                  </td>
                  <td class="js-td-images">
                    <span class="gray">Описание:  <?php echo $product['description'][1]['description'];?><br>
                      <?php foreach($product['attributs'] as $attributs){ ?>
                        <?php if($attributs['attribute_id'] == 12){ ?>
                          <div><span style="color:red;">Заметка:</span> <?php echo $attributs['product_attribute_description'][1]['text']; ?></div><br>
                        <?php } ?>
                      <?php } ?>

                    </span>
                    <span class="gray"></span>
                    <?php if($product['images']){ ?>
                      <?php foreach( $product['images'] as $image_item){ ?>
                        <a href="/image/<?php echo $image_item['image']; ?>" data-lightbox="gallery-<?php echo $product['product_id']; ?>"><img src="<?php echo $image_item['thumb']; ?>" class="td_thumb"></a>
                      <?php } ?>
                    <?php } elseif($product['image'] != ""){ ?>
                      <a href="<?php echo $product['thumb']; ?>" data-lightbox="gallery-<?php echo $product['product_id']; ?>"><img src="<?php echo $product['image']; ?>" class="td_thumb"></a>
                    <?php } ?>
                  </td>
                  <td>
                      <nobr>
                          <span class="pensil_action_input"><?php echo $product['price']; ?> USD</span>
                          <?php if( $user_id_com != 25 ){ ?>
                              <a data-price="<?php echo $product['price']; ?>" data-id="<?php echo $product['product_id']; ?>" class="pensil_action" style="margin-left:5px;" title="Изменить цену">
                                  <i aria-hidden="true" class="fa fa-pencil-square-o"></i>
                              </a>
                          <?php } ?>
                          <br>
                            <?php echo $product['price_BYN']; ?>
                          <br>
                        <span style="font-size:12px;">Цена за шт.</span>
                      </nobr>
                  </td>
                  <td>
                    <span title="<?php echo $product['date_added']; ?>"><nobr><?php echo $product['date_added']; ?></nobr></span>
                    <?php if($product['date_modified'] != "0000-00-00 00:00:00"){ ?>
                      <br>Изменено:<br>
                      <span title="<?php echo $product['date_modified']; ?>"><nobr><?php echo $product['date_modified']; ?></nobr></span>
                    <?php } ?>
                  </td>
                  <td>

                      <?php if($product['status'] == "Активно"){ ?>
                        <button class="btn btn-default fa fa-check-circle fa-lg color_green <?php if( $user_id_com != 25 ){ ?>status_favourite<?php } ?>" data-id="<?php echo $product['product_id']; ?>" title="активно">
                            Активно
                        </button>
                      <?php } else{ ?>
                        <button class="btn btn-default fa fa-times color_red <?php if( $user_id_com != 25 ){ ?>status_favourite<?php } ?>" data-id="<?php echo $product['product_id']; ?>" aria-hidden="true" title="неактивно">
                            Неактивно
                        </button>
                      <?php } ?>
                  </td>

                  <td style="text-align: center;">
                      <?php if( $user_id_com != 25 ){ ?>
                        <a data-productinfo="Артикул: <?php echo $product['model']; ?>" data-productid="<?php echo $product['product_id']; ?>" class="historyProduct" style="cursor: pointer;position: relative;">
                            <i class="fa fa-archive fa-lg"></i>
                            <?php if($product['change']){ ?>
                                <span class="shiny_change"> <?php echo count($product['change']); ?></span>
                            <?php } ?>
                        </a>
                        <a href="<?php echo $product['edit']; ?>" title="Редактировать"><i class="fa fa-pencil-square-o fa-lg"></i></a>
                        <a href="<?php echo $product['deleted_url']; ?>" title="Удалить" class="js-adv-delete deletedButton"><i class="fa fa-trash-o fa-lg"></i></a>
                        <a data-productid="<?php echo $product['product_id']; ?>" class="addPhotoButton"><i class="fa fa-camera"></i></a>
                      <?php } ?>
                    <a href="https://d4.by/index.php?route=product/shiny_form&product_id=<?php echo $product['product_id']; ?>" target="_blank" title="Посмотреть на сайте"><i class="fa fa-eye fa-lg"></i></a>
                    <br>
                    <?php
                      $product['cat_qr'] = str_replace('&nbsp;&nbsp;&gt;&nbsp;&nbsp;', ' ', $product['cat_qr']);
                      //$qr_title = "<div>".$product['cat_qr'] . ", " . $product['length'] . "г. " . $product['ean'] . "</div><div>" . $product['jan'] . " " .$product['isbn'] . " " . $product['mpn'] . " " . $product['upc'] . "</div><div>" . $product['manufers'] . "</div><div>" . '<span style="font-size:17px;">' .$product['modelQR'] . '</span></div>';
                      $qr_title = "<div>" . $product['marka'] . " " . $product['model_s'] . " " . $product['shirina'] . "/" . $product['vysota'] . " " . $product['r_size'] . ", " . $product['quantity'] . " шт., " . $product['season'] . ", " . $product['sostojan'] . '<div style="font-size:17px;">' .$product['model'] . '</div></div>';
                    ?>
                    <div style="color: #23b423;border-color: #23b423;margin-top:10px;" id="" class="btn btn-default printQrOuterLists" data-qrmodel="<?php echo $product['model']; ?>" data-qrid="<?php echo $product['product_id']; ?>" data-titles='<?php echo $qr_title; ?>'>Печать QR код</div>
                    <?php
                      require_once $_SERVER['DOCUMENT_ROOT'].'/gd/phpqrcode/qrlib.php';

                      /* Генерация QR-кода во временный файл */
                      QRcode::png('https://d4.by/gd/?product_id='.$product['product_id'], '/home/dby/sites/d4.by/gd/qr_shiny/'.$product['model'].'_tmp.png', 'Q', 6, 1);

                      /* Конвертация PNG8 в PNG24 */
                      $im = imagecreatefrompng($_SERVER['DOCUMENT_ROOT'].'/gd/qr_shiny/'.$product['model'].'_tmp.png');

                      $width = imagesx($im);
                      $height = imagesy($im);

                      // добавления цвета
                      $color_smx = explode('&nbsp;', $cat_qr);
                        $rgba_oux = '255,255,255';
                      $rgba_oux = explode(',', $rgba_oux);
                      $bg_color = imageColorAllocate($im, (int)$rgba_oux[0], (int)$rgba_oux[1], (int)$rgba_oux[2]);
                      for ($x = 0; $x < $width; $x++) {
                      for ($y = 0; $y < $height; $y++) {
                        $color = imagecolorat($im, $x, $y);
                        if ($color == 0) {
                        imageSetPixel($im, $x, $y, $bg_color);
                        }
                      }
                      }
                      // конец добавления цвета

                      $dst = imagecreatetruecolor($width, $height);
                      imagecopy($dst, $im, 0, 0, 0, 0, $width, $height);
                      imagedestroy($im);

                      /* Наложение логотипа */
                      $logo = imagecreatefrompng($_SERVER['DOCUMENT_ROOT'].'/gd/logo.png');
                      $logo_width = imagesx($logo);
                      $logo_height = imagesy($logo);

                      $new_width = $width / 3;
                      $new_height = $logo_height / ($logo_width / $new_width);

                      $x = ceil(($width - $new_width) / 2);
                      $y = ceil(($height - $new_height) / 2);

                      imagecopyresampled($dst, $logo, $x, $y, 0, 0, $new_width, $new_height, $logo_width, $logo_height);
                      imagepng($dst,$_SERVER['DOCUMENT_ROOT'].'/gd/qr_shiny/'.$product['model'].'_main.png',3);

                      unlink($_SERVER['DOCUMENT_ROOT'].'/gd/qr_shiny/'.$product['model'].'_tmp.png');

                      //$img_sm_qr1 = '<img src="https://d4.by/gd/qr_shiny/'.$product['model'].'_main.png" style="width:110px;">';
                      //echo '<br><br>';



                      //echo '<div style="display:flex;align-items:center;max-width:275px;border:1px solid #000;"><div>'.$img_sm_qr1.'</div><div style="text-align:center;font-size:12px;padding-left:10px;margin:0 auto;font-weight:bold;line-height:18px;">'.$qr_title.'</div></div>';
                  ?>

                  </td>
                </tr>
                <?php /* ONE SHINY END */ ?>
                <?php } ?>
            <?php } ?>
          </table>
          </div>
        </form>

        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>

  <iframe name="imgFrame" style="width: 0; height: 0; border: 0;color:#fff;"></iframe>

  <link type="text/css" href="view/stylesheet/lightbox.min.css" rel="stylesheet" media="screen" />
  <script type="text/javascript" src="view/stylesheet/lightbox.min.js"></script>

  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	var url = 'index.php?route=catalog/shiny&token=<?php echo $token; ?>';

  var filter_upc = $('#input-upc').val();

	if (filter_upc) {
		url += '&filter_upc=' + encodeURIComponent(filter_upc);
	}
  var filter_quantity = $('#input-quantity').val();

	if (filter_quantity) {
		url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
	}

	var filter_model = $('input[name=\'filter_model\']').val();

	if (filter_model) {
		url += '&filter_model=' + encodeURIComponent(filter_model);
	}

	var filter_location = $('#location_select').val();

	if (filter_location != '*') {
		url += '&filter_location=' + encodeURIComponent(filter_location);
	}

	var filter_shirina = $('#main__jan').val();

	if (filter_shirina != '*') {
		url += '&filter_shirina=' + encodeURIComponent(filter_shirina);
	}

	var length = $('#length').val();

	if (length != '*') {
		url += '&length=' + encodeURIComponent(length);
	}

  var filter_vysota = $('#main__isbn').val();

  if (filter_vysota != '*') {
    url += '&filter_vysota=' + encodeURIComponent(filter_vysota);
  }

  var version = $('#version').val();

  if (version != '*') {
    url += '&version=' + encodeURIComponent(version);
  }

  var sku_season = $('#sku_season').val();

  if (sku_season != '*') {
    url += '&sku_season=' + encodeURIComponent(sku_season);
  }

  var filter_r = $('#main__mpn').val();

  if (filter_r != '*') {
    url += '&filter_r=' + encodeURIComponent(filter_r);
  }

  var filter_ean = $('#ean_main').val();

  if (filter_ean != '*') {
    url += '&filter_ean=' + encodeURIComponent(filter_ean);
  }

  var status_filter = $('#status_filter').val();

  url += '&status_filter=' + encodeURIComponent(status_filter);


	location = url;
});

$('#button-clear').on('click', function() {
  var url = 'index.php?route=catalog/shiny&token=<?php echo $token; ?>';
  location = url;
});
//--></script>
<script>
   $(document).ready(function() {
		$('body').on('click','.printQrOuterLists', function(){
				var idThis = $(this).data('qrid');//здесь получаем ID
				var modelThis = $(this).data('qrmodel');//здесь получаем Model
				var titlesThis = $(this).data('titles'); // получаем title
				var this_elem = $(this);

				var frame = window.frames['imgFrame'];
				frame.document.write('<html><head><style>@print{@page :footer {color: #fff }@page :header {color: #fff}}</style></head><body style="font-family: Open Sans, sans-serif;" onload="window.print()"><div style="margin:0 auto;color:#000;display:flex;align-items:center;max-width:275px;border:1px solid #000;"><div><img src="https://d4.by/gd/qr_shiny/'+modelThis+'_main.png" style="width:110px;"></div><div style="text-align:center;font-size:12px;margin:0 auto;padding-left:10px;font-weight:bold;line-height:18px;">'+titlesThis+'</div></div></body></html>');
				frame.document.close();
		});
  });

$(document).ready(function() {

	$(".deletedButton").on("click", function () {
		return confirm("Вы действительно хотите удалить это объявление ?");
	});

    $('body').on("click", ".pensil_action",function (){

        if($(this).find('.fa').hasClass('fa-save')){
            if($('.value_input_price').val() == undefined || $('.value_input_price').val() == null || $('.value_input_price').val() == ""){
                var price = $(this).data("price");
                $(this).prev('.pensil_action_input').html(price + " USD");
            } else{
                var shinyId = $(this).data("id");
                var priceShiny = $('.value_input_price').val();
                $(this).prev('.pensil_action_input').html(priceShiny + " USD");

                $.ajax({
                    url: 'index.php?route=catalog/shiny/setPriceItem&token=<?php echo $token; ?>&shinyId='+shinyId+'&price='+priceShiny,
                    dataType: 'html',
                    data: {
                        "price" : priceShiny,
                        "shinyId" : shinyId
                    },
                    cache: false,
                    method: 'POST',
                    success: function(html) {
                        console.log(html);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
            $(this).find('.fa').removeClass('fa-save').addClass('fa-pencil-square-o');
        }else{
            var old_price = $('.pensil_action_input').text();
            $(this).prev('.pensil_action_input').html('<input class="value_input_price" type="text" val="'+old_price+'">');
            $(this).find('.fa').removeClass('fa-pencil-square-o').addClass('fa-save');
        }

    });
});
$(document).ready(function() {
		$('body').on('click','.status_favourite', function(e){
                e.preventDefault();
				// здесь отслеживаем выбор ID
				var selectedItem = $(this).data('id');//здесь получаем ID
				var this_elem = $(this);

				$.ajax({
					url: 'index.php?route=catalog/shiny/actions&token=<?php echo $token_ac; ?>&actions='+selectedItem,
					dataType: 'html',
					data: {
					"actions" : selectedItem
					},
					cache: false,
					method: 'POST',
					success: function(html) {
						var actions = html;
						if(actions == '1'){
                            this_elem.html('Активно');
							this_elem.attr('title', 'Активно');
							this_elem.attr('class','btn btn-default fa fa-check-circle fa-lg color_green status_favourite');
						}else{
                            this_elem.html('Неактивно');
							this_elem.attr('title', 'Неактивно');
							this_elem.attr('class','btn btn-default fa fa-times color_red status_favourite');
						}

					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
		});
        setInterval(function(){
          $('.status_qe').each(function() {
            if($(this).text() == "Активно"){
				//background:green;color:#000;font-weight:bold;
              $(this).css('background','#23b423').css('color','#000').css('font-weight','bold');
            }else if($(this).text() == "Неактивно"){
              $(this).css('background','red').css('color','#000').css('font-weight','bold');
            }
          });
        }, 500);
      });
</script>

</div>

<link rel="stylesheet" href="/admin/view/stylesheet/dropzone.css" />
<script src="/admin/view/javascript/dropzone.js"></script>


<?php $site_url_photo = "https://d4.by/upload.php"; ?>

<div id="myModalBox" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Загрузка изображения</h4>
            </div>
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

<div id="myModalBoxHistory" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Заголовок модального окна -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">История объявления <div style="font-size: 13px;" class="modal-subtitle"></div></h4>
            </div>
            <!-- Основное содержимое модального окна -->
            <div class="modal-body">
                <table class="historyTable1" style="width: 100%;border-collapse: collapse;">
                    <tr>
                        <td><strong>Значение</strong></td>
                        <td><strong>Дата изменения</strong></td>
                        <td><strong>Старое значение</strong></td>
                        <td><strong>Новое значение</strong></td>
                        <td><strong>Пользователь</strong></td>
                    </tr>
                </table>
                <table class="historyTable" style="width: 100%;border-collapse: collapse;"></table>
            </div>

            <div id="loaderHistory">
                <img src="/admin/view/images/loading.gif" alt="Загрузка" title="Загрузка" />
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function() {
        $('.addPhotoButton').on('click', function(){
            $("#myModalBox").modal('show');

            var productid = $(this).data('productid');
            $('#submit-all').attr('data-productid',productid);
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

        function loadHistory(productid, productinfo) {
            $.ajax({
                url: `index.php?route=catalog/shiny/getChangeProduct&token=<?php echo $token; ?>&product_id=${productid}`,
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
    });

    // add photo
    $(document).ready(function() {
        Dropzone.options.dropzoneFrom = {
            autoProcessQueue: false,
            maxFilesize: 2500, // MB
            parallelUploads: 20,
            maxThumbnailFilesize: 200,
            resizeWidth: 800,
            timeout: 180000000,
            acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
            renameFile: function (file) {
                let newName = new Date().getTime() + '_' + file.name;

                return newName;
            },
            init: function() {
                var submitButton = document.querySelector('#submit-all');
                myDropzone = this;
                submitButton.addEventListener("click", function() {
                    myDropzone.processQueue();
                });
                this.on("queuecomplete", function(data) {

                    <?php
                    $date_now = date("d.m.Y");
                    $time = strtotime($date_now);
                        ?>
                    var imgUpload = "";
                    var path = 'image/catalog/d4_img';
                    var folder_name = path + "/<?=$time?>/";
                    var mask_name = 'catalog/d4_img/' + "<?=$time?>/";

                    for(var cheker = 0;cheker <= myDropzone.files.length; cheker++){
                        if(myDropzone.files[cheker]){
                            // начало ajax добавление изображения в БД
                            $.ajax({
                                url: 'index.php?route=catalog/shiny/addImageListPage&token=<?php echo $token; ?>',
                                dataType: 'html',
                                data: {
                                    "product_id" : $('#submit-all').attr('data-productid'),
                                    "image": mask_name + myDropzone.files[cheker].upload.filename
                                },
                                cache: false,
                                method: 'POST',
                                success: function(html) {
                                    //alert('фотка добавлена в БД!');
                                },
                                error: function(xhr, ajaxOptions, thrownError) {
                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                }
                            });
                            // конец ajax добавление изображения
                        }
                    }

                    this.removeAllFiles();
                    $("#myModalBox").modal('hide');
                });

            },
        };

    });
    // end add photo

</script>
<script src="view/javascript/bootstrap-select.min.js"></script>
<script src="view/javascript/jquery.chained.js"></script>
<script>
$(document).ready(function() { //
  $('.selectpicker').selectpicker();
});
</script>
<style>
    .shiny_change {
        margin-left: 2px;
        background: #000000;
        border-radius: 50%;
        width: 13px;
        height: 13px;
        position: absolute;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #fff;
        top: -5px;
        right: 0;
        border: 1px solid red;
    }
    #loaderHistory{
        display: none;align-items: center;justify-content: center;padding: 20px;
    }
    #loaderHistory.active{
        display: flex;
    }
    .sku_qe_br{
        word-break: break-all;
    }
    .historyTable tr,.historyTable td{
        border: 1px solid black;text-align:center;
    }
    .historyTable1 tr,.historyTable1 td{
        border: 1px solid black;text-align:center;
    }
    .historyTable td,.historyTable1 td {
        width: 20%;padding: 5px;
    }
    body{
        color:#000;
        font-size: 13px !important;
    }
    body input::placeholder{
        color:#000 !important;
        font-size: 13px !important;

    }
    input.form-control{
        color:#000 !important;
    }
    .value_input_price{
        width: 100px;
    }
</style>
<link type="text/css" href="view/stylesheet/bootstrap-select.css" rel="stylesheet" media="screen" />
<style>
#input-upc,#input-quantity,#input-model,#input-price{height: 26px;background: #fff;}
  .form-control{
    background-color: #f5f5f5;
  }
  .color_green {
      color: green !important;
      outline: none !important;
      border-color: green !important;
      background-color: unset !important;
  }
  .color_red {
    color: red !important;
    border-color: red !important;
    outline: none !important;
    background-color: unset !important;
  }
  .well .form-group{
    clear: both;
    display: block;
    min-height: 60px;
  }
  .js-td-images{
    min-width:350px;
  }
  .addPhotoButton{
      cursor: pointer;
  }
</style>
<?php echo $footer; ?>
