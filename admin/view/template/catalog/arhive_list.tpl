<?php echo $header; ?><?php echo $column_left; ?>
<?php require_once $_SERVER['DOCUMENT_ROOT'].'/admin/product_config.php';?>
<div id="content">

  <link rel="stylesheet" href="/admin/view/javascript/lightbox.css" />
  <script src="/admin/view/javascript/lightbox.min.js"></script>
  
  <div class="page-header">
    <div class="container-fluid">
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
                  <?php /* Марка и модель */ ?>
                  <label class="col-sm-2 control-label" for="input-jan" style="font-weight:bold;">Марка и модель</span></label>
                  <div class="col-sm-2 padding-r-2">
                    <select id="main__jan" name="jan" class=" selectpicker" data-live-search="true">
                          <option value="" <?php echo ($jan == "") ? "selected='selected'" : "" ; ?>>Марка и модель</option>
                          <?php foreach($location_array as $width_shiny_item){ ?>
                            <option value="<?php echo $width_shiny_item; ?>" <?php echo ($width_shiny_item == $jan) ? "selected='selected'" : "" ; ?>><?php echo $width_shiny_item; ?></option>
                          <?php } ?>
                    </select>
                  </div>
                </div>

                <div class="form-group ">
                  <?php /* Год */ ?>
                  <label class="col-sm-2 control-label" for="input-length" style="font-weight:bold;">Год</span></label>
                  <div class="col-sm-2 padding-r-2">
                  <select id="select-length" name="length" class=" selectpicker" data-live-search="true">
                        <option value="*" <?php echo (round($length, 2) == "") ? "selected='selected'" : "" ; ?>>Выберите год</option>
                        <?php $year_max = date('Y');$year_max = (int)$year_max; ?>
                        <?php for($year_iteration = 1980; $year_iteration <= $year_max; $year_iteration++){ ?>
                          <option value="<?php echo $year_iteration; ?>"  <?php echo (round($length, 2) == $year_iteration) ? "selected='selected'" : "" ; ?>><?php echo $year_iteration; ?></option>
                        <?php } ?>
                  </select>
                  </div>
                </div>

                <div class="form-group ">
                  <?php /* Объем */ ?>
                  <label class="col-sm-2 control-label" for="input-jan" style="font-weight:bold;">Объем (+)</span></label>
                  <div class="col-sm-2 padding-r-2">
                  <input type="text" name="jan" value="<?php echo $jan; ?>" placeholder="Объем" id="input-jan" class="" />
                  </div>
                </div>

                <div class="form-group ">
                  <?php /* Тип топлива */ ?>
                  <label class="col-sm-2 control-label" for="input-isbn" style="font-weight:bold;">Тип топлива (+)</span></label>
                  <div class="col-sm-2 padding-r-2">
                    <select id="input-isbn" name="isbn" class=" selectpicker" data-live-search="true">
                          <option value="*" <?php echo ($isbn == "") ? "selected='selected'" : "" ; ?>>Тип топлива</option>
                          <?php foreach($oil_type as $oil_type_item){ ?>
                            <option value="<?php echo $oil_type_item; ?>" <?php echo ($oil_type_item == $isbn) ? "selected='selected'" : "" ; ?>><?php echo $oil_type_item; ?></option>
                          <?php } ?>
                    </select>
                  </div>
                </div>
                
                <div class="form-group ">
                  <?php /* Название запчасти */ ?>
                  <label class="col-sm-2 control-label" for="input-jan" style="font-weight:bold;">Название запчасти</span></label>
                  <div class="col-sm-2 padding-r-2">
                    <select id="main__jan" name="jan" class=" selectpicker" data-live-search="true">
                          <option value="" <?php echo ($jan == "") ? "selected='selected'" : "" ; ?>>Название запчасти</option>
                          <?php foreach($location_array as $width_shiny_item){ ?>
                            <option value="<?php echo $width_shiny_item; ?>" <?php echo ($width_shiny_item == $jan) ? "selected='selected'" : "" ; ?>><?php echo $width_shiny_item; ?></option>
                          <?php } ?>
                    </select>
                  </div>
                </div>
                
                <div class="form-group ">
                  <?php /* Артикул */ ?>
                  <label class="col-sm-2 control-label" for="input-model" style="font-weight:bold;">Артикул (+)</span></label>
                  <div class="col-sm-2 padding-r-2">
                    <input type="text" name="model" value="<?php echo $model; ?>" placeholder="Артикул" id="input-model" class="" />
                  </div>
                </div>
                
                <div class="form-group ">
                  <?php /* Номер запчасти */ ?>
                  <label class="col-sm-2 control-label" for="input-sku" style="font-weight:bold;">Номер запчасти (+)</span></label>
                  <div class="col-sm-2 padding-r-2">
                    <input type="text" name="sku" value="<?php echo $sku; ?>" placeholder="Номер запчасти" id="input-sku" class="" />
                  </div>
                </div>
                
                <div class="form-group ">
                  <?php /* Статус */ ?>
                  <label class="col-sm-2 control-label" for="input-status" style="font-weight:bold;">Статус(+)</span></label>
                  <div class="col-sm-2 padding-r-2">
                    <select name="status" id="input-status" class="">
                      <?php if ($status && $status == 1) { ?>
                        <option value="*">Выберите</option>
                        <option value="1" selected="selected">Активно</option>
                        <option value="0">Неактивно</option>
                      <?php } elseif($status && $status == 0) { ?>
                        <option value="*">Выберите</option>
                        <option value="1">Активно</option>
                        <option value="0" selected="selected">Неактивно</option>
                      <?php } else { ?>
                        <option value="*" selected="selected">Выберите</option>
                        <option value="1">Активно</option>
                        <option value="0">Неактивно</option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              </div>
              <div class="form-group ">
                <button type="button" style="font-weight: bold;background: #67d55c;font-size: 20px;" id="button-filter" class="btn  "><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
                <button type="button" style="font-weight: bold;background: #FFEB3B;font-size: 20px;" id="button-clear" class="btn  ">Сбросить</button>
              </div>


            </div>
          </div>
        </div>
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                 <td>Изображение</td>
                 <td>Марка и модель</td>
                 <td>Год</td>
                 <td>Объем</td>
                 <td>Тип топлива</td>
                 <td>Название запчасти</td>
                 <td>Артикул</td>
                 <td>Цена</td>
                 <td>Номер запчасти</td>
                 <td>Дата удаления</td>
                 <td>Статус</td>
                 <td>Описание</td>
                 <td>Действия</td>
                </tr>
              </thead>
              <tbody>
                <?php if ($products) { ?>
                <?php foreach ($products as $product) { ?>
                <tr>
                <td style="display: grid;grid-template-columns: 1fr 1fr 1fr;min-width:170px;"class="<?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>">
									<div style=" grid-column: 1 / -1;">
										<a data-lightbox="image<?php echo $product['product_id']; ?>" href="/image/<?php echo $product['popup']; ?>">
											<img src="<?php echo $product['image']; ?>" width="150px" alt="<?php echo $product['name']; ?>" class="img-thumbnail" data-id="<?php echo $product['product_id']; ?>" data-image="<?php echo $product['image']; ?>" />
										</a>
									</div>
									<?php foreach($product['images'] as $images__itm){ ?>
										<?php if($images__itm['image'] != $product['imgfix']){ ?>
											<a data-lightbox="image<?php echo $product['product_id']; ?>" href="/image/<?php echo $images__itm['image']; ?>">
												<img src="/image/<?php echo $images__itm['image']; ?>" width="50px" alt="<?php echo $product['name']; ?>" class="img-thumbnail" data-id="<?php echo $product['product_id']; ?>" data-image="<?php echo $product['image']; ?>" />
											</a>	
										<?php } ?>	
									<?php } ?>		
								</td>
                  <td><?php echo $product['category']; ?></td>
                  <td><?php echo $product['length']; ?></td>
                  <td><?php echo $product['objem']; ?></td>
                  <td><?php echo $product['toplivo']; ?></td>
                  <td><?php echo $product['manufacturer']; ?></td>
                  <td><?php echo $product['model']; ?></td>
                  <td><?php echo $product['price']; ?>$</td>
                  <td><?php echo $product['sku']; ?></td>
                  <td><?php echo $product['date_delete']; ?></td>
                  <td><?php echo $product['status']; ?></td>
                  <td><?php echo $product['description']; ?></td>
                  <td>
                    <a style="width: 100%;" href="<?php echo $product['edit']; ?>" class="btn btn-primary">Смотреть</a>
                    <?php if($product['date_delete'] != ""){ ?>
                      <br>
                      <a style="width: 100%;"  data-textrest="Вы точно хотите восстановить запчасть '<?php echo $product['manufacturer']; ?>' - <?php echo preg_replace('/<.+>/U', ' ', $product['category']); ?>?" href="<?php echo $product['restore']; ?>" class="restoreButton btn btn-success">Восстановить</a>
                    <?php } ?>
                  </td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="13"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
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


  <?php /* javascript for bootstrap select */ ?>
  <script src="view/javascript/bootstrap-select.min.js"></script>
  <script src="view/javascript/jquery.chained.js"></script>
  
  <script>
    $(document).ready(function() {
      $(".restoreButton").on("click", function () {
        return confirm($(this).data('textrest'));
      });
    });
  </script>
  <script>
      $(document).ready(function() { //
          $('.selectpicker').selectpicker();
      });
  </script>
  <link type="text/css" href="view/stylesheet/bootstrap-select.css" rel="stylesheet" media="screen" />


  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	var url = 'index.php?route=catalog/arhive&token=<?php echo $token; ?>';

	var filter_name = $('input[name=\'filter_name\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	var filter_length = $('#select-length').val();

	if (filter_length != '*') {
		url += '&filter_length=' + encodeURIComponent(filter_length);
	}
  
	var filter_model = $('#input-model').val();

	if (filter_model) {
		url += '&filter_model=' + encodeURIComponent(filter_model);
	}
 
  var filter_jan = $('#input-jan').val();

  if (filter_jan) {
    url += '&filter_jan=' + encodeURIComponent(filter_jan);
  }

  var filter_sku = $('#input-sku').val();

  if (filter_sku) {
    url += '&filter_sku=' + encodeURIComponent(filter_sku);
  }

	var filter_price = $('input[name=\'filter_price\']').val();

	if (filter_price) {
		url += '&filter_price=' + encodeURIComponent(filter_price);
	}


	var filter_category = $('select[name=\'filter_category\']').val();

  if (filter_category != '*') {
		url += '&filter_category=' + encodeURIComponent(filter_category);
	}

	var filter_quantity = $('input[name=\'filter_quantity\']').val();

	if (filter_quantity) {
		url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
	}
  
	var filter_isbn = $('#input-isbn').val();

	if (filter_isbn != '*') {
		url += '&filter_isbn=' + encodeURIComponent(filter_isbn);
	}

	var filter_status = $('#input-status').val();

	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}

	location = url;
});
//--></script>
  <script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
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
});

$('#button-clear').on('click', function() {
  window.location.href = 'https://d4.by/admin/index.php?route=catalog/arhive&token=<?php echo $_GET['token'];?>';
});

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

<style>
  .form-group + .form-group {
      border-top: none !important;
  }
</style>
<?php echo $footer; ?>
