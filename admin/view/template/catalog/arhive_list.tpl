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
    <div class="">
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
                 <td>Описание</td>
                 <td>Действия</td>
                </tr>
              </thead>
              <tbody>

                <?php /* FILTER START */ ?>
                  <tr>
                  <td>-</td>
                  <td>
                    <?php /* Марка и модель */ ?>
                    <select name="filter_category" id="input-category" class=" selectpicker" data-live-search="true">
                      <option value="*">Выберите</option>
                      <?php foreach ($categories as $category) { ?>
                      <?php //if ($category['product_count'] >= 1) { ?>
                      <?php if ($category['category_id']==$filter_category) { ?>
                      <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?>&nbsp;&nbsp;&nbsp;&nbsp;</option>
                      <?php } else { ?>
                      <option value="<?php echo $category['category_id']; ?>">&nbsp;&nbsp;<?php echo $category['name']; ?>&nbsp;&nbsp;&nbsp;&nbsp;</option>
                      <?php } ?>
                      <?php //} ?>
                      <?php } ?>
                    </select>
                  </td>
                  <td>
                    <?php /* Год */ ?>
                    <select id="select-length" name="length" class=" selectpicker" data-live-search="true">
                          <option value="*" <?php echo (round($filter_length, 2) == "") ? "selected='selected'" : "" ; ?>>Год</option>
                          <?php $year_max = date('Y');$year_max = (int)$year_max; ?>
                          <?php for($year_iteration = 1980; $year_iteration <= $year_max; $year_iteration++){ ?>
                            <option value="<?php echo $year_iteration; ?>"  <?php echo (round($filter_length, 2) == $year_iteration) ? "selected='selected'" : "" ; ?>><?php echo $year_iteration; ?></option>
                          <?php } ?>
                    </select>
                  </td>
                  <td>
                    <?php /* Объем */ ?>
                    <div class="">
                      <input type="text" name="jan" value="<?php echo $filter_jan; ?>" placeholder="Объем" id="input-jan" class="" />
                    </div>
                  </td>
                  <td>
                    <select id="input-isbn" name="isbn" class=" selectpicker" data-live-search="true">
                          <option value="*" <?php echo ($filter_isbn == "") ? "selected='selected'" : "" ; ?>>Тип топлива</option>
                          <?php foreach($oil_type as $oil_type_item){ ?>
                            <option value="<?php echo $oil_type_item; ?>" <?php echo ($oil_type_item == $filter_isbn) ? "selected='selected'" : "" ; ?>><?php echo $oil_type_item; ?></option>
                          <?php } ?>
                    </select>
                  </td>
                  <td>
                    <select id="main__manufacturer" name="manufacturer" class=" selectpicker" data-live-search="true">
                          <option value="*" <?php echo ($filter_manufacturer == "") ? "selected='selected'" : "" ; ?>>Название запчасти</option>
                          <?php foreach($manufacturers as $item){ ?>
                            <option value="<?php echo $item['manufacturer_id']; ?>" <?php echo ($item['manufacturer_id'] == $filter_manufacturer) ? "selected='selected'" : "" ; ?>><?php echo $item['name']; ?></option>
                          <?php } ?>
                    </select>
                  </td>
                  <td>
                    <div class="">
                      <input type="text" name="model" value="<?php echo $filter_model; ?>" placeholder="Артикул" id="input-model"/>
                    </div>
                  </td>
                  <td>-</td>
                  <td>
                    <div class="">
                      <input type="text" name="sku" value="<?php echo $filter_sku; ?>" placeholder="Номер запчасти" id="input-sku" />
                    </div>
                  </td>
                  <td>-</td>
                  <td>-</td>
                  <td>
                    <button type="button" style="padding: 2px 13px;font-weight: bold;background: #67d55c;font-size: 20px;" id="button-filter" class="btn">Поиск</button><br>
                    <button type="button" style="padding: 2px 13px;font-weight: bold;background: #FFEB3B;font-size: 20px;" id="button-clear" class="btn">Сброс</button>
                  </td>
                  </tr>
                <?php /* FILTER END */ ?>

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
                  <td class="sku_qe_br"><?php echo $product['sku']; ?></td>
                  <td><?php echo $product['date_delete']; ?></td>
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

  <style>
    .sku_qe_br{white-space:pre}
  </style>
  <script>
      $(document).ready(function() { //
          $('.same_pick').selectpicker();
          $('.select2-selection__clear').on('click', function(){
              $(this).next().find('select').val('default');
              $(this).next().find('select').selectpicker("refresh");
              $(this).next().val('');
          });
          window.onload = function() {
              $('.sku_qe_br').each(function () {
                  var tags = $(this).text();
                  var newString = tags.replace(/,/g, ",\n");
                  $(this).text(newString);
              });
          }
      });
  </script>

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

	var filter_category = $('select[name=\'filter_category\']').val();

  if (filter_category != '*') {
		url += '&filter_category=' + encodeURIComponent(filter_category);
	}

  var filter_manufacturer = $('#main__manufacturer').val();

  if (filter_manufacturer != '*') {
    url += '&filter_manufacturer=' + encodeURIComponent(filter_manufacturer);
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
$('#input-model').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/arhive/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request),
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

//--></script></div>

<style>
  .form-group + .form-group {
      border-top: none !important;
  }
  input,  select{
    width: auto !important;
    border: 1px solid #000;
    border-radius: 3px;
    color:#000;
  }
  input{
    
    max-width: 60px;
  }
  .well input::placeholder{
    color:#000;
  }
  .btn-default{
    border-color: #000;
  }
  .btn-default:hover{
    background-color: #fff !important; 
     border-color: #000;
  }
  .bootstrap-select .dropdown-menu{
    min-width:auto !important;
  }
  .bootstrap-select .dropdown-menu{
    right:unset !important;
  }
  .bs-searchbox input{
    width: 100% !important;
    max-width:100% !important;
  }
  .bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
      width: 100px;
  }
</style>
<?php echo $footer; ?>
