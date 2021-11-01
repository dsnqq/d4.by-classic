<?php echo $header; ?><?php echo $column_left; ?>
<?php require_once $_SERVER['DOCUMENT_ROOT'].'/admin/shiny_config.php';?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <?php /*<button type="submit" form="form-product" formaction="<?php echo $copy; ?>" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="btn btn-default"><i class="fa fa-copy"></i></button>*/?>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
            <div class="form-group required">
                <?php /* Ширина */ ?>
                <label class="col-sm-2 control-label" for="input-jan" style="font-weight:bold;">Ширина *, высота *, R * </span></label>
                <div class="col-sm-1 padding-r-2">
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
            <div class="form-group required">
                <label class="col-sm-2 control-label" style="font-weight:bold;">Марка *, модель </label>
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

            <div class="form-group required">
                <label class="col-sm-2 control-label" style="font-weight:bold;"> Состояние *, сезон *, количество *</label>

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
                <div class="col-sm-1">
                    <input type="text" name="quantity" value="<?php echo $quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="form-control" />
                </div>

            </div>

            <?php /* Тип авто, год выпуска шин */ ?>
            <div class="form-group">
                <label class="col-sm-2 control-label">Тип авто, год выпуска шин</label>
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
                        <option value="*" <?php echo (round($length, 2) == "") ? "selected='selected'" : "" ; ?>>Выберите год</option>
                        <?php $year_max = date('Y');$year_max = (int)$year_max; ?>
                        <?php for($year_iteration = 1980; $year_iteration <= $year_max; $year_iteration++){ ?>
                          <option value="<?php echo $year_iteration; ?>"  <?php echo (round($length, 2) == $year_iteration) ? "selected='selected'" : "" ; ?>><?php echo $year_iteration; ?></option>
                        <?php } ?>
                  </select>
                </div>
            </div>
              <div class="form-group ">
                <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
                <div class="col-sm-3">
                  <input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
                  <?php if ($error_model) { ?>
                  <div class="text-danger"><?php echo $error_model; ?></div>
                  <?php } ?>
                </div>
              </div>
              <button type="button" id="button-filter" class="btn btn-success btn-lg" style="margin-left: 15px;"><i class="fa fa-filter"></i> Поиск</button>
              <button type="button" id="button-clear" class="btn btn-warning btn-lg" style="margin-left: 15px;"><i class="fa fa-filter"></i> Сбросить</button>
          </div>
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
                    <br>
                    <span class="grey">Артикул: <?php echo $product['model']; ?></span>
                  </td>
                  <td class="js-td-images">
                    <span class="gray">Описание:  <?php echo $product['description'][1]['description'];?><br></span>
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
                    <nobr><?php echo $product['price']; ?> USD</nobr>
                  </td>
                  <td>
                    <span title="<?php echo mb_substr($product['date_added'], 10); ?>"><nobr><?php echo mb_substr($product['date_added'], 0, -8); ?></nobr></span>
                    <?php if($product['date_modified'] != "0000-00-00 00:00:00"){ ?>
                      <br>Изменено:<br>
                      <span title="<?php echo mb_substr($product['date_modified'], 10); ?>"><nobr><?php echo mb_substr($product['date_modified'], 0, -8); ?></nobr></span>
                    <?php } ?>
                  </td>
                  <td>
                      <?php if($product['status'] == "Активно"){ ?>
                        <i class="fa fa-check-circle fa-lg color_green status_favourite" data-id="<?php echo $product['product_id']; ?>" title="активно"></i>
                      <?php } else{ ?>
                        <i class="fa fa-times color_red status_favourite" data-id="<?php echo $product['product_id']; ?>" aria-hidden="true" title="неактивно"></i>
                      <?php } ?>
                  </td>

                  <td>
                    <a href="<?php echo $product['edit']; ?>" title="Редактировать"><i class="fa fa-pencil-square-o fa-lg"></i></a>
                    <a href="<?php echo $product['deleted_url']; ?>" title="Удалить" class="js-adv-delete deletedButton"><i class="fa fa-trash-o fa-lg"></i></a>
                    <a target="_blank" title="Посмотреть на сайте"><i class="fa fa-external-link fa-lg"></i></a>
                   
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
  
  
	location = url;
});

$('#button-clear').on('click', function() {
  var url = 'index.php?route=catalog/shiny&token=<?php echo $token; ?>';
  location = url;
});
//--></script>
<script>

$(document).ready(function() {
	
	$(".deletedButton").on("click", function () {
		return confirm("Вы действительно хотите удалить это объявление ?");
	});
});
$(document).ready(function() {
		$('body').on('click','.status_favourite', function(){
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
							this_elem.attr('title', 'Активно');
							this_elem.attr('class','fa fa-check-circle fa-lg color_green status_favourite');
						}else{
							this_elem.attr('title', 'Неактивно');
							this_elem.attr('class','fa fa-times color_red status_favourite');
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

  <script type="text/javascript"><!--
/*$('input[name=\'filter_name\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_name\']').val(item['label']);
	}
});*/
/*
$('input[name=\'filter_model\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['model'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_model\']').val(item['label']);
	}
});*/
//--></script></div>

<?php /* javascript for bootstrap select */ ?>
<script src="view/javascript/bootstrap-select.min.js"></script>
<script src="view/javascript/jquery.chained.js"></script>
<script>
$(document).ready(function() { // 
  $('.selectpicker').selectpicker();
});
</script>
<style>
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
</style>
<link type="text/css" href="view/stylesheet/bootstrap-select.css" rel="stylesheet" media="screen" />
<style>
#input-upc,#input-quantity,#input-model{height: 26px;background: #fff;}
  .form-control{
    background-color: #f5f5f5;
  }
  .color_green {
      color: green;
  }
  .color_red {
    color: red;
  }
  .well .form-group{
    
    display: block;
    min-height: 60px;
  }
</style>
<?php echo $footer; ?>
