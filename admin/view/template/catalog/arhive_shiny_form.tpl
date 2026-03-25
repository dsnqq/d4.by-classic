<?php echo $header; ?>

<link rel="stylesheet" href="/admin/view/stylesheet/dropzone.css" />
<script src="/admin/view/javascript/dropzone.js"></script>

<?php require_once $_SERVER['DOCUMENT_ROOT'].'/admin/shiny_config.php';?>

<link type="text/css" href="view/stylesheet/shiny.css" rel="stylesheet" />
<link type="text/css" href="view/stylesheet/bootstrap-select.css" rel="stylesheet" media="screen" />

<?php echo $column_left; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="Назад" class="btn btn-default"><i class="fa fa-reply"></i> Вернуться к архиву</a>
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
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> Просмотр архивных шин</h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
                    <!---<ul class="nav nav-tabs">
                      <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                      <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
                      <li><a href="#tab-links" data-toggle="tab"><?php echo $tab_links; ?></a></li>
                      <li><a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
                      <li><a href="#tab-option" data-toggle="tab"><?php echo $tab_option; ?></a></li>
                      <?php /*<li><a href="#tab-recurring" data-toggle="tab"><?php echo $tab_recurring; ?></a></li> */?>
                      <li><a href="#tab-discount" data-toggle="tab"><?php echo $tab_discount; ?></a></li>
                      <?php /*<li><a href="#tab-special" data-toggle="tab"><?php echo $tab_special; ?></a></li>*/?>
                      <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
                      <?php /*<li><a href="#tab-reward" data-toggle="tab"><?php echo $tab_reward; ?></a></li>*/?>
                      <?php /* <li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>*/?>
                    </ul>--->
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">

                            <?php /* Статус */ ?>
                            <div class="form-group ">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-2">
                                    <select name="status" id="input-status" class="form-control">
                                        <?php if ($status) { ?>
                                        <option value="1" selected="selected">Активно</option>
                                        <option value="0">Неактивно</option>
                                        <?php } else { ?>
                                        <option value="1">Активно</option>
                                        <option value="0" selected="selected">Неактивно</option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group hide">
                                <label class="col-sm-2 control-label " for="input-category"><?php echo $entry_main_category; ?></label>
                                <div class="col-sm-4">
                                    <select id="main_category_id" name="main_category_id" class="form-control selectpicker" data-live-search="true">
                                        <option value="0" selected="selected"><?php echo $text_none; ?></option>
                                        <?php foreach($categories as $category) { ?>
                                        <?php if($category['category_id'] == $main_category_id) { ?>

                                        <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                                <?php /*if(strpos($_SERVER['REQUEST_URI'],'catalog/product/add') !== false){?>
                                <div style="clear:both;"></div>
                                <label class="col-sm-2"></label>
                                <div class="addMoreSection col-sm-4">
                                <?php if(!empty($main_category_dop)){?>
                                <?php $main_cate = 1; ?>
                                <?php foreach($main_category_dop as $main_category_dop__item){ ?>
                                <select id="main_category_id" name="main_category_dop[]" class="form-control selectpicker addMoreSection<?=$main_cate?>" data-live-search="true">
                                <option value="0" selected="selected"><?php echo $text_none; ?></option>
                                <?php foreach($categories as $category) { ?>
                                <?php if($category['category_id'] == $main_category_dop__item) { ?>
                                <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                                </select>
                                <?php $main_cate++; ?>
                                <?php } ?>
                                <?php } ?>
                            </div>

                            <div style="clear:both;"></div>
                            <div class="col-sm-2"></div>
                            <div class="addMoreProduct col-sm-3">Добавить еще</div>
                            <div class="removeMoreProduct col-sm-3">Удалить последний</div>
                            <?php }*/ ?>
                        </div>
                        <?php /*
              <div class="form-group hide">
                        <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="" data-original-title="(Автозаполнение)"><?php echo $entry_category; ?></span></label>
                        <div class="col-sm-3">
                            <input type="text" name="category" value="" placeholder="<?php echo $entry_category; ?>" id="input-category" class="form-control" autocomplete="off">
                            <div id="product-category" class="well well-sm" style="height: 80px; overflow: auto;">
                                <?php foreach($categories as $category) { ?>
                                <?php if (in_array($category['category_id'], $product_category)) { ?>
                                <div id="product-category<?php echo $category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category['name']; ?>
                                    <input type="hidden" name="product_category[]" value="<?php echo $category['category_id']; ?>">
                                </div>
                                <?php } ?>
                                <?php } ?>
                            </div>
                        </div>
                    </div> */ ?>

                    <div class="form-group required">
                        <?php /* Ширина */ ?>
                        <label class="col-sm-2 control-label" for="input-jan" style="font-weight:bold;">Ширина *, высота *, R * </span></label>
                        <div class="col-sm-1 padding-r-2">
                            <select id="main__jan" name="jan" class="form-control selectpicker" data-live-search="true">
                                <option value="" <?php echo ($jan == "") ? "selected='selected'" : "" ; ?>>Ширина *</option>
                                <?php foreach($width_shiny as $width_shiny_item){ ?>
                                <option value="<?php echo $width_shiny_item; ?>" <?php echo ($width_shiny_item == $jan) ? "selected='selected'" : "" ; ?>><?php echo $width_shiny_item; ?></option>
                                <?php } ?>
                            </select>
                        </div>

                        <?php /* Высота */ ?>
                        <div class="col-sm-2 padding-l-r-2">
                            <select id="main__isbn" name="isbn" class="form-control selectpicker" data-live-search="true">
                                <option value="" <?php echo ($jan == "") ? "selected='selected'" : "" ; ?>>Высота *</option>
                                <?php foreach($height_shiny as $height_shiny_item){ ?>
                                <option value="<?php echo $height_shiny_item; ?>" <?php echo ($height_shiny_item == $isbn) ? "selected='selected'" : "" ; ?>><?php echo $height_shiny_item; ?></option>
                                <?php } ?>
                            </select>
                        </div>

                        <?php /* R */ ?>
                        <div class="col-sm-2 padding-l-r-2">
                            <select id="main__mpn" name="mpn" class="form-control selectpicker" data-live-search="true">
                                <option value="" <?php echo ($mpn == "") ? "selected='selected'" : "" ; ?>>R *</option>
                                <?php foreach($location_array as $location_array_item){ ?>
                                <option value="<?php echo $location_array_item; ?>" <?php echo ($location_array_item == $mpn) ? "selected='selected'" : "" ; ?>><?php echo $location_array_item; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <?php /* Марка */ ?>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" style="font-weight:bold;">Марка *, модель </label>
                        <div class="col-sm-2  padding-r-2">
                            <select id="ean_main" name="ean" class="form-control selectpicker" data-live-search="true">
                                <option value="" <?php echo ($ean == "") ? "selected='selected'" : "" ; ?>>Марка *</option>
                                <?php foreach($marka_shiny as $marka_shiny_item){ ?>
                                <option value="<?php echo $marka_shiny_item; ?>" <?php echo ($marka_shiny_item == $ean) ? "selected='selected'" : "" ; ?>><?php echo $marka_shiny_item; ?></option>
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
                            <select id="" name="location" class="form-control selectpicker" data-live-search="true">
                                <option value="" <?php echo ($location == "") ? "selected='selected'" : "" ; ?>>Состояние *</option>
                                <?php foreach($sostojanije as $sostojanije_item){ ?>
                                <option value="<?php echo $sostojanije_item; ?>" <?php echo ($sostojanije_item == $location) ? "selected='selected'" : "" ; ?>><?php echo $sostojanije_item; ?></option>
                                <?php } ?>
                            </select>
                        </div>

                        <?php /* Сезон */ ?>
                        <div class="col-sm-2 padding-l-r-2">
                            <select id="" name="sku" class="form-control selectpicker" data-live-search="true">
                                <option value="" <?php echo ($sku == "") ? "selected='selected'" : "" ; ?>>Сезон *</option>
                                <?php foreach($season as $season__item){ ?>
                                <option value="<?php echo $season__item; ?>" <?php echo ($season__item == $sku) ? "selected='selected'" : "" ; ?>><?php echo $season__item; ?></option>
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
                            <select id="" name="version" class="form-control selectpicker" data-live-search="true">
                                <option value="" <?php echo ($version == "") ? "selected='selected'" : "" ; ?>>Тип авто</option>
                                <?php foreach($versions as $version_item){ ?>
                                <option value="<?php echo $version_item; ?>" <?php echo ($version_item == $version) ? "selected='selected'" : "" ; ?>><?php echo $version_item; ?></option>
                                <?php } ?>
                            </select>
                        </div>

                        <?php /* модель */ ?>
                        <div class="col-sm-2 padding-l-r-2">
                            <select id="" name="length" class="form-control selectpicker" data-live-search="true">
                                <option value="" <?php echo (round((float)$length, 2) == "") ? "selected='selected'" : "" ; ?>>Выберите год</option>
                                <?php $year_max = date('Y');$year_max = (int)$year_max; ?>
                                <?php for($year_iteration = 1980; $year_iteration <= $year_max; $year_iteration++){ ?>
                                <option value="<?php echo $year_iteration; ?>"  <?php echo (round((float)$length, 2) == $year_iteration) ? "selected='selected'" : "" ; ?>><?php echo $year_iteration; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>


                    <?php /* Запчасть
            <div class="form-group required ">
                    <label class="col-sm-2 control-label" for="input-manufacturer"><?php echo $entry_manufacturer; ?></label>
                    <div class="col-sm-5">
                        <select id="input-manufacturer" name="manufacturer_id" class="form-control selectpicker" data-live-search="true">
                            <option value="0" selected="selected"><?php echo $text_none; ?></option>
                            <?php foreach ($manufacturers as $manufacturer) { ?>
                            <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>

                            <option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
            </div>*/ ?>


            <ul class="nav nav-tabs" id="language" style="display:none;">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
            </ul>
            <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                    <?php /* Тут скрытое название */ ?>
                    <div class="form-group hide">
                        <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                        <div class="col-sm-3">
                            <input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                            <?php if (isset($error_name[$language['language_id']])) { ?>
                            <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <script>
                        setInterval(function(){
                            // заполняем поле name
                            model = $("#input-upc").text();
                            marka = $("#ean_main option:selected").text();

                            $('#input-name1').val(model + " " + marka);
                        }, 500);
                    </script>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                        <div class="col-sm-4">
                            <textarea style="height:70px;" name="product_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" data-lang="<?php echo $lang; ?>" class="form-control <?php /*summernote*/ ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea>
                        </div>
                    </div>
                    <div class="form-group hide">
                        <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                        <div class="col-sm-3">
                            <input type="text" name="product_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                            <?php if (isset($error_meta_title[$language['language_id']])) { ?>
                            <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group hide">
                        <label class="col-sm-2 control-label" for="input-meta-h1<?php echo $language['language_id']; ?>"><?php echo $entry_meta_h1; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="product_description[<?php echo $language['language_id']; ?>][meta_h1]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_h1'] : ''; ?>" placeholder="<?php echo $entry_meta_h1; ?>" id="input-meta-h1<?php echo $language['language_id']; ?>" class="form-control" />
                        </div>
                    </div>
                    <div class="form-group hide">
                        <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                        <div class="col-sm-10">
                            <textarea name="product_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                        </div>
                    </div>
                    <div class="form-group hide">
                        <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                        <div class="col-sm-10">
                            <textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                        </div>
                    </div>
                    <div class="form-group" style="display:none;">
                        <label class="col-sm-2 control-label" for="input-tag<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_tag; ?>"><?php echo $entry_tag; ?></span></label>
                        <div class="col-sm-10">
                            <input type="text" name="product_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>" placeholder="<?php echo $entry_tag; ?>" id="input-tag<?php echo $language['language_id']; ?>" class="form-control" />
                        </div>
                    </div>
                </div>
                <?php } ?>
            </div>
        </div>

        <div class="tab-pane active" id="tab-data">
            <div class="form-group ">
                <label class="col-sm-2 control-label" for="input-model"><?php echo $entry_model; ?></label>
                <div class="col-sm-3">
                    <input type="text" name="model" value="<?php echo $model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="form-control" />
                    <?php if ($error_model) { ?>
                    <div class="text-danger"><?php echo $error_model; ?></div>
                    <?php } ?>
                </div>
            </div>

            <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-price"><?php echo $entry_price; ?></label>
                <div class="col-sm-3">
                    <input type="text" name="price" value="<?php echo $price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="form-control" />
                </div>
            </div>
            <div class="form-group hide">
                <label class="col-sm-2 control-label" for="input-price">Процент скидки (мин.5%)</label>
                <div class="col-sm-3">
                    <input type="text" name="procent_price" value="" placeholder="Процент скидки (мин.5%)" class="form-control procent_price" />
                </div>
            </div>
            <?php /*
              <div class="hide" id="">
            <div class="table-responsive">
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
                            <input type="text" name="product_special[0][priority]" value="<?php $product_specials[0]['priority']; ?>" placeholder="Приоритет:" class="form-control">
                        </td>
                        <td class="text-right">
                            <input type="text" name="product_special[0][price]" value="<?php $product_specials[0]['price']; ?>" placeholder=""  class="itogo_price" style="border:none;outline:none;">
                        </td>
                        <td class="text-left hide" style="width: 20%;">
                            <div class="input-group date">
                                <input type="text" name="product_special[0][date_start]" value="<?php $product_specials[0]['date_start']; ?>" placeholder="Дата начала:" data-date-format="YYYY-MM-DD" class="form-control"><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>
                        </td>
                        <td class="text-left hide" style="width: 20%;">
                            <div class="input-group date">
                                <input type="text" name="product_special[0][date_end]" value="<?php $product_specials[0]['date_end']; ?>" placeholder="Дата окончания:" data-date-format="YYYY-MM-DD" class="form-control"><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div>
                        </td>
                        <td class="text-left hide">
                            <button type="button" onclick="$('#special-row0').remove();" data-toggle="tooltip" title="Удалить" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div> */ ?>


        <div class="form-group hide">
            <label class="col-sm-2 control-label" for="input-tax-class"><?php echo $entry_tax_class; ?></label>
            <div class="col-sm-3">
                <select name="tax_class_id" id="input-tax-class" class="form-control">
                    <option value="0"><?php echo $text_none; ?></option>
                    <?php foreach ($tax_classes as $tax_class) { ?>
                    <?php if ($tax_class['tax_class_id'] == $tax_class_id) { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
            </div>
        </div>


        <div class="form-group hide">
            <label class="col-sm-2 control-label" for="input-minimum"><span data-toggle="tooltip" title="<?php echo $help_minimum; ?>"><?php echo $entry_minimum; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="minimum" value="<?php echo $minimum; ?>" placeholder="<?php echo $entry_minimum; ?>" id="input-minimum" class="form-control" />
            </div>
        </div>
        <div class="form-group hide">
            <label class="col-sm-2 control-label" for="input-subtract"><?php echo $entry_subtract; ?></label>
            <div class="col-sm-10">
                <select name="subtract" id="input-subtract" class="form-control">
                    <?php if ($subtract) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>
        <div class="form-group hide">
            <label class="col-sm-2 control-label" for="input-stock-status"><span data-toggle="tooltip" title="<?php echo $help_stock_status; ?>"><?php echo $entry_stock_status; ?></span></label>
            <div class="col-sm-10">
                <select name="stock_status_id" id="input-stock-status" class="form-control">
                    <?php foreach ($stock_statuses as $stock_status) { ?>
                    <?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
                    <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
            </div>
        </div>
        <div class="form-group hide">
            <label class="col-sm-2 control-label"><?php echo $entry_shipping; ?></label>
            <div class="col-sm-10">
                <label class="radio-inline">
                    <input type="radio" name="shipping" value="1"  checked="checked"/>
                    <?php echo $text_yes; ?>
                </label>
                <label class="radio-inline">
                    <input type="radio" name="shipping" value="0"/>
                    <?php echo $text_no; ?>
                </label>
            </div>
        </div>
        <div class="form-group hide">
            <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
                <?php if ($error_keyword) { ?>
                <div class="text-danger"><?php echo $error_keyword; ?></div>
                <?php } ?>
            </div>
        </div>
        <?php /* Дата поступления */ ?>
        <div class="form-group hide">
            <label class="col-sm-2 control-label" for="input-date-available"><?php echo $entry_date_available; ?></label>
            <div class="col-sm-3">
                <div class="input-group date">
                    <input type="text" name="date_available" value="<?php echo $date_available; ?>" placeholder="<?php echo $entry_date_available; ?>" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button" style="padding: 3px;"><i class="fa fa-calendar"></i></button>
                    </span></div>
            </div>
        </div>
        <div class="form-group hide">
            <label class="col-sm-2 control-label" for="input-length-class"><?php echo $entry_length_class; ?></label>
            <div class="col-sm-10">
                <select name="length_class_id" id="input-length-class" class="form-control">
                    <?php foreach ($length_classes as $length_class) { ?>
                    <?php if ($length_class['length_class_id'] == $length_class_id) { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
            </div>
        </div>
        <div class="form-group hide">
            <label class="col-sm-2 control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
            <div class="col-sm-10">
                <select name="weight_class_id" id="input-weight-class" class="form-control">
                    <?php foreach ($weight_classes as $weight_class) { ?>
                    <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
            </div>
        </div>

        <div class="form-group hide">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
                <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
        </div>
    </div>
    <div class="tab-pane active" id="tab-links">
        <div class="form-group hide">
            <label class="col-sm-2 control-label" for="input-filter"><span data-toggle="tooltip" title="<?php echo $help_filter; ?>"><?php echo $entry_filter; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="filter" value="" placeholder="<?php echo $entry_filter; ?>" id="input-filter" class="form-control" />
                <div id="product-filter" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_filters as $product_filter) { ?>
                    <div id="product-filter<?php echo $product_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_filter['name']; ?>
                        <input type="hidden" name="product_filter[]" value="<?php echo $product_filter['filter_id']; ?>" />
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
        <div class="form-group hide">
            <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
            <div class="col-sm-10">
                <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <div class="checkbox">
                        <label>
                            <?php if (in_array(0, $product_store)) { ?>
                            <input type="checkbox" name="product_store[]" value="0" checked="checked" />
                            <?php echo $text_default; ?>
                            <?php } else { ?>
                            <input type="checkbox" name="product_store[]" value="0" />
                            <?php echo $text_default; ?>
                            <?php } ?>
                        </label>
                    </div>
                    <?php foreach ($stores as $store) { ?>
                    <div class="checkbox">
                        <label>
                            <?php if (in_array($store['store_id'], $product_store)) { ?>
                            <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                            <?php echo $store['name']; ?>
                            <?php } else { ?>
                            <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" />
                            <?php echo $store['name']; ?>
                            <?php } ?>
                        </label>
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
        <div class="form-group hide">
            <label class="col-sm-2 control-label" for="input-download"><span data-toggle="tooltip" title="<?php echo $help_download; ?>"><?php echo $entry_download; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="download" value="" placeholder="<?php echo $entry_download; ?>" id="input-download" class="form-control" />
                <div id="product-download" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_downloads as $product_download) { ?>
                    <div id="product-download<?php echo $product_download['download_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_download['name']; ?>
                        <input type="hidden" name="product_download[]" value="<?php echo $product_download['download_id']; ?>" />
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
        <div class="form-group hide">
            <label class="col-sm-2 control-label" for="input-related"><span data-toggle="tooltip" title="<?php echo $help_related; ?>"><?php echo $entry_related; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="related" value="" placeholder="<?php echo $entry_related; ?>" id="input-related" class="form-control" />
                <div id="product-related" class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php foreach ($product_relateds as $product_related) { ?>
                    <div id="product-related<?php echo $product_related['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product_related['name']; ?>
                        <input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>


    <div class="tab-pane hide" id="tab-option">
        <div class="row">
            <div class="col-sm-2">
                <ul class="nav nav-pills nav-stacked" id="option">
                    <?php $option_row = 0; ?>
                    <?php foreach ($product_options as $product_option) { ?>
                    <li><a href="#tab-option<?php echo $option_row; ?>" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$('a[href=\'#tab-option<?php echo $option_row; ?>\']').parent().remove(); $('#tab-option<?php echo $option_row; ?>').remove(); $('#option a:first').tab('show');"></i> <?php echo $product_option['name']; ?></a></li>
                    <?php $option_row++; ?>
                    <?php } ?>
                    <li>
                        <input type="text" name="option" value="" placeholder="<?php echo $entry_option; ?>" id="input-option" class="form-control" />
                    </li>
                </ul>
            </div>
            <div class="col-sm-10">
                <div class="tab-content">
                    <?php $option_row = 0; ?>
                    <?php $option_value_row = 0; ?>
                    <?php foreach ($product_options as $product_option) { ?>
                    <div class="tab-pane" id="tab-option<?php echo $option_row; ?>">
                        <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_id]" value="<?php echo $product_option['product_option_id']; ?>" />
                        <input type="hidden" name="product_option[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />
                        <input type="hidden" name="product_option[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />
                        <input type="hidden" name="product_option[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-required<?php echo $option_row; ?>"><?php echo $entry_required; ?></label>
                            <div class="col-sm-10">
                                <select name="product_option[<?php echo $option_row; ?>][required]" id="input-required<?php echo $option_row; ?>" class="form-control">
                                    <?php if ($product_option['required']) { ?>
                                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                    <option value="0"><?php echo $text_no; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_yes; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <?php if ($product_option['type'] == 'text') { ?>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($product_option['type'] == 'textarea') { ?>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                            <div class="col-sm-10">
                                <textarea name="product_option[<?php echo $option_row; ?>][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control"><?php echo $product_option['value']; ?></textarea>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($product_option['type'] == 'file') { ?>
                        <div class="form-group" style="display: none;">
                            <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" id="input-value<?php echo $option_row; ?>" class="form-control" />
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($product_option['type'] == 'date') { ?>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                            <div class="col-sm-3">
                                <div class="input-group date">
                                    <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value<?php echo $option_row; ?>" class="form-control" />
                                    <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                            </span></div>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($product_option['type'] == 'time') { ?>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                            <div class="col-sm-10">
                                <div class="input-group time">
                                    <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value<?php echo $option_row; ?>" class="form-control" />
                                    <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($product_option['type'] == 'datetime') { ?>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-value<?php echo $option_row; ?>"><?php echo $entry_option_value; ?></label>
                            <div class="col-sm-10">
                                <div class="input-group datetime">
                                    <input type="text" name="product_option[<?php echo $option_row; ?>][value]" value="<?php echo $product_option['value']; ?>" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value<?php echo $option_row; ?>" class="form-control" />
                                    <span class="input-group-btn">
                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                            </span></div>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
                        <div class="table-responsive">
                            <table id="option-value<?php echo $option_row; ?>" class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td class="text-left"><?php echo $entry_option_value; ?></td>
                                    <td class="text-right"><?php echo $entry_quantity; ?></td>
                                    <td class="text-left"><?php echo $entry_subtract; ?></td>
                                    <td class="text-right"><?php echo $entry_price; ?></td>
                                    <td class="text-right"><?php echo $entry_option_points; ?></td>
                                    <td class="text-right"><?php echo $entry_weight; ?></td>
                                    <td></td>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
                                <tr id="option-value-row<?php echo $option_value_row; ?>">
                                    <td class="text-left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]" class="form-control">
                                            <?php if (isset($option_values[$product_option['option_id']])) { ?>
                                            <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                                            <?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
                                            <option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
                                            <?php } else { ?>
                                            <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                                            <?php } ?>
                                            <?php } ?>
                                            <?php } ?>
                                        </select>
                                        <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value="<?php echo $product_option_value['product_option_value_id']; ?>" /></td>
                                    <td class="text-right"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                                    <td class="text-left"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]" class="form-control">
                                            <?php if ($product_option_value['subtract']) { ?>
                                            <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                            <option value="0"><?php echo $text_no; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_yes; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                            <?php } ?>
                                        </select></td>
                                    <td class="text-right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]" class="form-control">
                                            <?php if ($product_option_value['price_prefix'] == '+') { ?>
                                            <option value="+" selected="selected">+</option>
                                            <?php } else { ?>
                                            <option value="+">+</option>
                                            <?php } ?>
                                            <?php if ($product_option_value['price_prefix'] == '-') { ?>
                                            <option value="-" selected="selected">-</option>
                                            <?php } else { ?>
                                            <option value="-">-</option>
                                            <?php } ?>
                                        </select>
                                        <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $product_option_value['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                                    <td class="text-right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]" class="form-control">
                                            <?php if ($product_option_value['points_prefix'] == '+') { ?>
                                            <option value="+" selected="selected">+</option>
                                            <?php } else { ?>
                                            <option value="+">+</option>
                                            <?php } ?>
                                            <?php if ($product_option_value['points_prefix'] == '-') { ?>
                                            <option value="-" selected="selected">-</option>
                                            <?php } else { ?>
                                            <option value="-">-</option>
                                            <?php } ?>
                                        </select>
                                        <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $product_option_value['points']; ?>" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>
                                    <td class="text-right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]" class="form-control">
                                            <?php if ($product_option_value['weight_prefix'] == '+') { ?>
                                            <option value="+" selected="selected">+</option>
                                            <?php } else { ?>
                                            <option value="+">+</option>
                                            <?php } ?>
                                            <?php if ($product_option_value['weight_prefix'] == '-') { ?>
                                            <option value="-" selected="selected">-</option>
                                            <?php } else { ?>
                                            <option value="-">-</option>
                                            <?php } ?>
                                        </select>
                                        <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>
                                    <td class="text-left"><button type="button" onclick="$(this).tooltip('destroy');$('#option-value-row<?php echo $option_value_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                                </tr>
                                <?php $option_value_row++; ?>
                                <?php } ?>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="6"></td>
                                    <td class="text-left"><button type="button" onclick="addOptionValue('<?php echo $option_row; ?>');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                        <select id="option-values<?php echo $option_row; ?>" style="display: none;">
                            <?php if (isset($option_values[$product_option['option_id']])) { ?>
                            <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                            <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                        <?php } ?>
                    </div>
                    <?php $option_row++; ?>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane hide" id="tab-recurring">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <td class="text-left"><?php echo $entry_recurring; ?></td>
                    <td class="text-left"><?php echo $entry_customer_group; ?></td>
                    <td class="text-left"></td>
                </tr>
                </thead>
                <tbody>
                <?php $recurring_row = 0; ?>
                <?php foreach ($product_recurrings as $product_recurring) { ?>

                <tr id="recurring-row<?php echo $recurring_row; ?>">
                    <td class="text-left"><select name="product_recurring[<?php echo $recurring_row; ?>][recurring_id]" class="form-control">
                            <?php foreach ($recurrings as $recurring) { ?>
                            <?php if ($recurring['recurring_id'] == $product_recurring['recurring_id']) { ?>
                            <option value="<?php echo $recurring['recurring_id']; ?>" selected="selected"><?php echo $recurring['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select></td>
                    <td class="text-left"><select name="product_recurring[<?php echo $recurring_row; ?>][customer_group_id]" class="form-control">
                            <?php foreach ($customer_groups as $customer_group) { ?>
                            <?php if ($customer_group['customer_group_id'] == $product_recurring['customer_group_id']) { ?>
                            <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select></td>
                    <td class="text-left"><button type="button" onclick="$('#recurring-row<?php echo $recurring_row; ?>').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                </tr>
                <?php $recurring_row++; ?>
                <?php } ?>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="2"></td>
                    <td class="text-left"><button type="button" onclick="addRecurring()" data-toggle="tooltip" title="<?php echo $button_recurring_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <div class="tab-pane active" id="tab-discount">
        <div class="table-responsive">
            <table id="discount" class="table table-striped table-bordered table-hover hide">
                <thead>
                <tr>
                    <td class="text-left"><?php echo $entry_customer_group; ?></td>
                    <td class="text-right"><?php echo $entry_quantity; ?></td>
                    <td class="text-right"><?php echo $entry_priority; ?></td>
                    <td class="text-right"><?php echo $entry_price; ?></td>
                    <td class="text-left"><?php echo $entry_date_start; ?></td>
                    <td class="text-left"><?php echo $entry_date_end; ?></td>
                    <td></td>
                </tr>
                </thead>
                <tbody>
                <?php $discount_row = 0; ?>
                <?php foreach ($product_discounts as $product_discount) { ?>
                <tr id="discount-row<?php echo $discount_row; ?>">
                    <td class="text-left"><select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]" class="form-control">
                            <?php foreach ($customer_groups as $customer_group) { ?>
                            <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
                            <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select></td>
                    <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>
                    <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
                    <td class="text-right"><input type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                    <td class="text-left" style="width: 20%;"><div class="input-group date">
                            <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                            <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                    <td class="text-left" style="width: 20%;"><div class="input-group date">
                            <input type="text" name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                            <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                    <td class="text-left"><button type="button" onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                </tr>
                <?php $discount_row++; ?>
                <?php } ?>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="6"></td>
                    <td class="text-left"><button type="button" onclick="addDiscount();" data-toggle="tooltip" title="<?php echo $button_discount_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <div class="hide" id="tab-special">
        <div class="table-responsive">
            <table id="special" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <td class="text-left"><?php echo $entry_customer_group; ?></td>
                    <td class="text-right"><?php echo $entry_priority; ?></td>
                    <td class="text-right"><?php echo $entry_price; ?></td>
                    <td class="text-left"><?php echo $entry_date_start; ?></td>
                    <td class="text-left"><?php echo $entry_date_end; ?></td>
                    <td></td>
                </tr>
                </thead>
                <tbody>
                <?php $special_row = 0; ?>
                <?php foreach ($product_specials as $product_special) { ?>
                <tr id="special-row<?php echo $special_row; ?>">
                    <td class="text-left"><select name="product_special[<?php echo $special_row; ?>][customer_group_id]" class="form-control">
                            <?php foreach ($customer_groups as $customer_group) { ?>
                            <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
                            <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select></td>
                    <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>
                    <td class="text-right"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>
                    <td class="text-left" style="width: 20%;"><div class="input-group date">
                            <input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                            <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                    <td class="text-left" style="width: 20%;"><div class="input-group date">
                            <input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                            <span class="input-group-btn">
                          <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                          </span></div></td>
                    <td class="text-left"><button type="button" onclick="$('#special-row<?php echo $special_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                </tr>
                <?php $special_row++; ?>
                <?php } ?>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="5"></td>
                    <td class="text-left"><button type="button" onclick="addSpecial();" data-toggle="tooltip" title="<?php echo $button_special_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <div class="tab-pane active" id="tab-data"></div>
    <div class="tab-pane active" id="tab-image" style="margin-top: 15px;position: absolute;opacity: 0;left: -99999999px;">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <td class="text-left"><?php echo $entry_image; ?></td>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <td class="text-left"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" /></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="table-responsive">
            <table id="images" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <td class="text-left"><?php echo $entry_additional_image; ?></td>
                    <td class="text-right"><?php echo $entry_sort_order; ?></td>
                    <td></td>
                </tr>
                </thead>
                <tbody>
                <?php $image_row = 0; ?>
                <?php foreach ($product_images as $product_image) { ?>
                <tr id="image-row<?php echo $image_row; ?>">
                    <td class="text-left"><a href="" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="input-image<?php echo $image_row; ?>" /></td>
                    <td class="text-right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
                    <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger">Удалить фото</button></td>
                </tr>
                <?php $image_row++; ?>
                <?php } ?>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="2"></td>
                    <td class="text-left">
                        <button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary">Добавить фото</button>
                        <?php /*<button type="button" onclick="addMultiImage();" data-toggle="tooltip" title="<?php echo $button_image_add; ?>" class="btn btn-primary">Добавить фото</button>*/ ?>

                    </td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>


    <div id="preview">
        <div class="row itemsBlockFlex">
            <?php $photo_num = 0; ?>
            <?php echo ($image) ? '<input type="hidden" name="image" value="' . $image . '" id="input-image-main" class="input-image-main-dop">' : '<input type="hidden" name="image" value="" id="input-image-main" class="input-image-main-dop">'; ?>

            <?php foreach ($product_images as $product_photo) { ?>
            <div class="itemsBlock">
                <img src="https://d4.by/image/<?=$product_photo['image']?>" class="img-thumbnail" width="175" height="175" style="height:175px;" />
                <input type="hidden" class="image_for_main" name="product_image[<?=$photo_num?>][image]" value="<?=$product_photo['image']?>" id="input-photo1">
                <input type="hidden" name="product_image[<?=$photo_num?>][sort_order]" value="<?php echo $product_photo['sort_order']; ?>" class="sort_order">
                <button type="button" class="btn btn-link remove_image" id="/image/<?=$product_photo['image']?>">Удалить</button>
                <button type="button" class="btn btn-link main_image<?php if($image == $product_photo['image']) echo " activeMain";?>">Главное фото</button>
            </div>
            <?php $photo_num++; ?>
            <?php } ?>
        </div>
    </div>

    <div class="btn btn-primary modalOpenAddPhotoMe"><i class="fa fa-plus-circle"></i>Добавить фото</div>


    <br><br><br>
    <div class="form-group"><br>
        <div class="col-xs-12">Список атрибутов по желанию ("Имя для связи", "Складская информация", "Телефон,если другой")</div>
    </div>
    <div class="tab-pane active" id="tab-attribute">
        <div class="table-responsive">
            <table id="attribute" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <td class="text-left"><?php echo $entry_attribute; ?></td>
                    <td class="text-left"><?php echo $entry_text; ?></td>
                    <td></td>
                </tr>
                </thead>
                <tbody>
                <?php $attribute_row = 0; ?>
                <?php foreach ($product_attributes as $product_attribute) { ?>
                <tr id="attribute-row<?php echo $attribute_row; ?>">
                    <td class="text-left" style="width: 40%;"><input type="text" name="product_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $product_attribute['name']; ?>" placeholder="<?php echo $entry_attribute; ?>" class="form-control" />
                        <input type="hidden" name="product_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $product_attribute['attribute_id']; ?>" /></td>
                    <td class="text-left"><?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon" style="padding:3px;"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                            <?php /*<textarea name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea> */ ?>
                            <input autocomplete="on" name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" placeholder="<?php echo $entry_text; ?>" value="<?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?>">
                        </div>
                        <?php } ?></td>
                    <td class="text-left"><button type="button" onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                </tr>
                <?php $attribute_row++; ?>
                <?php } ?>
                </tbody>
                <?php /*
                  <tbody>
                <!-- складская информация -->
                <tr id="attribute-row0">
                    <td class="text-left" style="width: 40%;">
                        <input type="text" name="product_attribute[0][name]" value="Складская информация (заметка)" placeholder="Атрибут:" class="form-control" autocomplete="off" />
                        <ul class="dropdown-menu" style="top: 1248px; left: 280px; display: none;">
                            <li class="dropdown-header">Информация</li>
                            <li data-value="12"><a href="#">&nbsp;&nbsp;&nbsp;Складская информация (заметка)</a></li>
                        </ul>
                        <input type="hidden" name="product_attribute[0][attribute_id]" value="12" />
                    </td>
                    <td class="text-left">
                        <div class="input-group">
                            <span class="input-group-addon" style="padding: 3px;"></span>
                            <textarea name="product_attribute[0][product_attribute_description][1][text]" rows="5" placeholder="Текст:" class="form-control">Запчасть Захара</textarea>
                        </div>
                    </td>
                    <td class="text-left"></td>
                </tr>
                <!-- конец складская информация -->

                <!-- телефон если другой -->
                <tr id="attribute-row1">
                    <td class="text-left" style="width: 40%;">
                        <input type="text" name="product_attribute[1][name]" value="Телефон, если другой" placeholder="Атрибут:" class="form-control" autocomplete="off" />
                        <ul class="dropdown-menu"></ul>
                        <input type="hidden" name="product_attribute[1][attribute_id]" value="13" />
                    </td>
                    <td class="text-left">
                        <div class="input-group">
                            <span class="input-group-addon" style="padding: 3px;"></span>
                            <textarea name="product_attribute[1][product_attribute_description][1][text]" rows="5" placeholder="Текст:" class="form-control">+375(29) 824-89-27 Viber WhatsApp Telegram</textarea>
                        </div>
                    </td>
                    <td class="text-left"></td>
                </tr>
                <!-- конец телефон если другой -->

                <!-- город -->
                <tr id="attribute-row2">
                    <td class="text-left" style="width: 40%;">
                        <input type="text" name="product_attribute[2][name]" value="Город" placeholder="Атрибут:" class="form-control" autocomplete="off" />
                        <ul class="dropdown-menu"></ul>
                        <input type="hidden" name="product_attribute[2][attribute_id]" value="17" />
                    </td>
                    <td class="text-left">
                        <div class="input-group">
                            <span class="input-group-addon" style="padding: 3px;"></span>
                            <textarea name="product_attribute[2][product_attribute_description][1][text]" rows="5" placeholder="Текст:" class="form-control">Брест</textarea>
                        </div>
                    </td>
                    <td class="text-left"></td>
                </tr>
                <!-- конец город -->
                </tbody> */?>
                <tfoot>
                <tr>
                    <td colspan="2"></td>
                    <td class="text-left"><button type="button" onclick="addAttribute();" data-toggle="tooltip" title="<?php echo $button_attribute_add; ?>" class="btn btn-primary">Добавить атрибут</button></td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <div class="tab-pane hide" id="tab-reward">
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-points"><span data-toggle="tooltip" title="<?php echo $help_points; ?>"><?php echo $entry_points; ?></span></label>
            <div class="col-sm-10">
                <input type="text" name="points" value="<?php echo $points; ?>" placeholder="<?php echo $entry_points; ?>" id="input-points" class="form-control" />
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <td class="text-left"><?php echo $entry_customer_group; ?></td>
                    <td class="text-right"><?php echo $entry_reward; ?></td>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($customer_groups as $customer_group) { ?>
                <tr>
                    <td class="text-left"><?php echo $customer_group['name']; ?></td>
                    <td class="text-right"><input type="text" name="product_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset($product_reward[$customer_group['customer_group_id']]) ? $product_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" class="form-control" /></td>
                </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
    <div class="tab-pane hide" id="tab-design">
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <td class="text-left"><?php echo $entry_store; ?></td>
                    <td class="text-left"><?php echo $entry_layout; ?></td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="text-left"><?php echo $text_default; ?></td>
                    <td class="text-left"><select name="product_layout[0]" class="form-control">
                            <option value=""></option>
                            <?php foreach ($layouts as $layout) { ?>
                            <?php if (isset($product_layout[0]) && $product_layout[0] == $layout['layout_id']) { ?>
                            <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select></td>
                </tr>
                <?php foreach ($stores as $store) { ?>
                <tr>
                    <td class="text-left"><?php echo $store['name']; ?></td>
                    <td class="text-left"><select name="product_layout[<?php echo $store['store_id']; ?>]" class="form-control">
                            <option value=""></option>
                            <?php foreach ($layouts as $layout) { ?>
                            <?php if (isset($product_layout[$store['store_id']]) && $product_layout[$store['store_id']] == $layout['layout_id']) { ?>
                            <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select></td>
                </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>


</form>



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
<script>
    $(document).ready(function() {
        $('body').on('click','.main_image', function(){
            var _main_photo = $(this).parent('.itemsBlock').find('.image_for_main').val();
            $('button').removeClass('activeMain');
            $(this).addClass('activeMain');
            $('.input-image-main-dop').attr("value",_main_photo);
        });
        $('.modalOpenAddPhotoMe').on('click', function(){
            $("#myModalBox").modal('show');
        });
    });
    $(document).ready(function() {
        Dropzone.options.dropzoneFrom = {
            autoProcessQueue: false,
            maxFilesize: 25, // MB
            parallelUploads: 10,
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
                /*this.on("complete", function(file) {
                  myDropzone.removeFile(file);
                });*/
                this.on("queuecomplete", function(data) {
                    //console.log(myDropzone.files); // name
                    <?php
                    $date_now = date("d.m.Y");
                    $time = strtotime($date_now);
                        ?>
                    var imgUpload = "";
                    var path = 'image/catalog/d4_img';
                    var folder_name = path + "/<?=$time?>/";
                    var mask_name = 'catalog/d4_img/' + "<?=$time?>/";
                    if($('.itemsBlock').length > 0){
                        var sameFile = $('.itemsBlock').length;
                    } else{
                        var sameFile = 0;
                    }

                    for(var cheker = 0;cheker <= myDropzone.files.length; cheker++){
                        if(myDropzone.files[cheker]){
                            if(sameFile == 0) {classActive = "activeMain";}else{classActive = "";}
                            imgUpload = '<div class="itemsBlock">' +
                                '<img src="' + myDropzone.files[cheker].dataURL + '" class="img-thumbnail" width="175" height="175" style="height:175px;" />' +
                                '<input type="hidden" class="image_for_main" name="product_image['+sameFile+'][image]" value="'+mask_name+myDropzone.files[cheker].upload.filename+'" id="input-photo1">' +
                                '<input type="hidden" name="product_image['+sameFile+'][sort_order]" value="" class="sort_order">' +
                                '<button type="button" class="btn btn-link remove_image" id="'+folder_name+myDropzone.files[cheker].upload.filename + '">Удалить</button>' +
                                '<button type="button" class="btn btn-link main_image '+classActive+'">Главное фото</button>' +
                                '</div>';
                            if( $('#preview').html().trim() === '' || $('.input-image-main-dop').val() == "") {
                                $('#preview').html('<div class="row itemsBlockFlex"><input type="hidden" name="image" value="'+mask_name+myDropzone.files[cheker].upload.filename+'" id="input-image-main" class="input-image-main-dop">'+imgUpload+'</div>');
                            } else{
                                $('#preview').find('.row').append(imgUpload);
                            }
                        }
                        sameFile++;
                    }
                    this.removeAllFiles();
                    $("#myModalBox").modal('hide');
                });

            },
        };

        function list_image() {
            $.ajax({
                url: "<?=$site_url_photo?>",
                success: function(data) {
                    if( $('#preview').html().trim() === '') {
                        $('#preview').html('<div class="row">'+data+'</div>');
                    } else{
                        $('#preview').find('.row').html(data);
                    }

                }
            });
        }

        $(document).on('click', '.remove_image', function() {
            $(this).parent('.itemsBlock').remove();
        });

        $('.procent_price').on('input', function(){
            if($('#input-price').val() !== ""){
                var itogo = parseInt($('#input-price').val()) - (parseInt($('#input-price').val())/100)*parseInt($(this).val());
                $('.itogo_price').val(itogo);
            }
        });

    });
</script>
</div>
</div>
</div>

<script type="text/javascript"><!--
    <?php if ($ckeditor) { ?>
    <?php foreach ($languages as $language) { ?>
            ckeditorInit('input-description<?php echo $language['language_id']; ?>', getURLVar('token'));
            <?php } ?>
    <?php } ?>
    //--></script>
<script type="text/javascript"><!--
    // Manufacturer
    $('input[name=\'manufacturer\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    json.unshift({
                        manufacturer_id: 0,
                        name: '<?php echo $text_none; ?>'
                    });

                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['manufacturer_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'manufacturer\']').val(item['label']);
            $('input[name=\'manufacturer_id\']').val(item['value']);
        }
    });

    // Category
    $('input[name=\'category\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['category_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'category\']').val('');

            $('#product-category' + item['value']).remove();

            $('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
        }
    });

    $('#product-category').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });

    // Filter
    $('input[name=\'filter\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['filter_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'filter\']').val('');

            $('#product-filter' + item['value']).remove();

            $('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');
        }
    });

    $('#product-filter').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });

    // Downloads
    $('input[name=\'download\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/download/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['download_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'download\']').val('');

            $('#product-download' + item['value']).remove();

            $('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_download[]" value="' + item['value'] + '" /></div>');
        }
    });

    $('#product-download').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });

    // Related
    $('input[name=\'related\']').autocomplete({
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
            $('input[name=\'related\']').val('');

            $('#product-related' + item['value']).remove();

            $('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');
        }
    });

    $('#product-related').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });
    //--></script>
<script type="text/javascript"><!--
    var attribute_row = <?php echo $attribute_row; ?>;

    function addAttribute() {
        html  = '<tr id="attribute-row' + attribute_row + '">';
        html += '  <td class="text-left" style="width: 20%;"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
        html += '  <td class="text-left">';
        <?php foreach ($languages as $language) { ?>
            html += '<div class="input-group"><span class="input-group-addon" style="padding:3px;"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input autocomplete="on" name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class=""></div>';
            <?php } ?>
        html += '  </td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger">Удалить атрибут</button></td>';
        html += '</tr>';

        $('#attribute tbody').append(html);

        attributeautocomplete(attribute_row);

        attribute_row++;
    }

    function attributeautocomplete(attribute_row) {
        $('input[name=\'product_attribute[' + attribute_row + '][name]\']').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                category: item.attribute_group,
                                label: item.name,
                                value: item.attribute_id
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(item['label']);
                $('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
            }
        });
    }

    $('#attribute tbody tr').each(function(index, element) {
        attributeautocomplete(index);
    });
    //--></script>
<script type="text/javascript"><!--
    var option_row = <?php echo $option_row; ?>;

    $('input[name=\'option\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            category: item['category'],
                            label: item['name'],
                            value: item['option_id'],
                            type: item['type'],
                            option_value: item['option_value']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            html  = '<div class="tab-pane" id="tab-option' + option_row + '">';
            html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
            html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + item['label'] + '" />';
            html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
            html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + item['type'] + '" />';

            html += '	<div class="form-group">';
            html += '	  <label class="col-sm-2 control-label" for="input-required' + option_row + '"><?php echo $entry_required; ?></label>';
            html += '	  <div class="col-sm-10"><select name="product_option[' + option_row + '][required]" id="input-required' + option_row + '" class="form-control">';
            html += '	      <option value="1"><?php echo $text_yes; ?></option>';
            html += '	      <option value="0"><?php echo $text_no; ?></option>';
            html += '	  </select></div>';
            html += '	</div>';

            if (item['type'] == 'text') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
                html += '	</div>';
            }

            if (item['type'] == 'textarea') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                html += '	  <div class="col-sm-10"><textarea name="product_option[' + option_row + '][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control"></textarea></div>';
                html += '	</div>';
            }

            if (item['type'] == 'file') {
                html += '	<div class="form-group" style="display: none;">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
                html += '	</div>';
            }

            if (item['type'] == 'date') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                html += '	  <div class="col-sm-3"><div class="input-group date"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                html += '	</div>';
            }

            if (item['type'] == 'time') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                html += '	  <div class="col-sm-10"><div class="input-group time"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                html += '	</div>';
            }

            if (item['type'] == 'datetime') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                html += '	  <div class="col-sm-10"><div class="input-group datetime"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                html += '	</div>';
            }

            if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image') {
                html += '<div class="table-responsive">';
                html += '  <table id="option-value' + option_row + '" class="table table-striped table-bordered table-hover">';
                html += '  	 <thead>';
                html += '      <tr>';
                html += '        <td class="text-left"><?php echo $entry_option_value; ?></td>';
                html += '        <td class="text-right"><?php echo $entry_quantity; ?></td>';
                html += '        <td class="text-left"><?php echo $entry_subtract; ?></td>';
                html += '        <td class="text-right"><?php echo $entry_price; ?></td>';
                html += '        <td class="text-right"><?php echo $entry_option_points; ?></td>';
                html += '        <td class="text-right"><?php echo $entry_weight; ?></td>';
                html += '        <td></td>';
                html += '      </tr>';
                html += '  	 </thead>';
                html += '  	 <tbody>';
                html += '    </tbody>';
                html += '    <tfoot>';
                html += '      <tr>';
                html += '        <td colspan="6"></td>';
                html += '        <td class="text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
                html += '      </tr>';
                html += '    </tfoot>';
                html += '  </table>';
                html += '</div>';

                html += '  <select id="option-values' + option_row + '" style="display: none;">';

                for (i = 0; i < item['option_value'].length; i++) {
                    html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
                }

                html += '  </select>';
                html += '</div>';
            }

            $('#tab-option .tab-content').append(html);

            $('#option > li:last-child').before('<li><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick=" $(\'#option a:first\').tab(\'show\');$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove();"></i>' + item['label'] + '</li>');

            $('#option a[href=\'#tab-option' + option_row + '\']').tab('show');

            $('[data-toggle=\'tooltip\']').tooltip({
                container: 'body',
                html: true
            });

            $('.date').datetimepicker({
                pickTime: false
            });

            $('.time').datetimepicker({
                pickDate: false
            });

            $('.datetime').datetimepicker({
                pickDate: true,
                pickTime: true
            });

            option_row++;
        }
    });
    //--></script>
<script type="text/javascript"><!--
    var option_value_row = <?php echo $option_value_row; ?>;

    function addOptionValue(option_row) {
        html  = '<tr id="option-value-row' + option_value_row + '">';
        html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
        html += $('#option-values' + option_row).html();
        html += '  </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
        html += '  <td class="text-right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
        html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" class="form-control">';
        html += '    <option value="1"><?php echo $text_yes; ?></option>';
        html += '    <option value="0"><?php echo $text_no; ?></option>';
        html += '  </select></td>';
        html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" class="form-control">';
        html += '    <option value="+">+</option>';
        html += '    <option value="-">-</option>';
        html += '  </select>';
        html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
        html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]" class="form-control">';
        html += '    <option value="+">+</option>';
        html += '    <option value="-">-</option>';
        html += '  </select>';
        html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>';
        html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" class="form-control">';
        html += '    <option value="+">+</option>';
        html += '    <option value="-">-</option>';
        html += '  </select>';
        html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" rel="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#option-value' + option_row + ' tbody').append(html);
        $('[rel=tooltip]').tooltip();

        option_value_row++;
    }
    //--></script>
<script type="text/javascript"><!--
    var discount_row = <?php echo $discount_row; ?>;

    function addDiscount() {
        html  = '<tr id="discount-row' + discount_row + '">';
        html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][customer_group_id]" class="form-control">';
        <?php foreach ($customer_groups as $customer_group) { ?>
            html += '    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
            <?php } ?>
        html += '  </select></td>';
        html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
        html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
        html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
        html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
        html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#discount tbody').append(html);

        $('.date').datetimepicker({
            pickTime: false
        });

        discount_row++;
    }
    //--></script>
<script type="text/javascript"><!--
    var special_row = <?php echo $special_row; ?>;

    function addSpecial() {
        html  = '<tr id="special-row' + special_row + '">';
        html += '  <td class="text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="form-control">';
        <?php foreach ($customer_groups as $customer_group) { ?>
            html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
            <?php } ?>
        html += '  </select></td>';
        html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
        html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
        html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
        html += '  <td class="text-left" style="width: 20%;"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#special tbody').append(html);

        $('.date').datetimepicker({
            pickTime: false
        });

        special_row++;
    }
    //--></script>
<script type="text/javascript"><!--
    var image_row = <?php echo $image_row; ?>;
    /*
    function addMultiImage() {
                    $('#modal-image').remove();
                    $.ajax({
                        url: 'index.php?route=common/multifilemanager&token=' + getURLVar('token') + '&image_row=' + image_row,
                        dataType: 'html',
                        beforeSend: function() {
                            $('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
                            $('#button-image').prop('disabled', true);
                        },
                        complete: function() {
                            $('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
                            $('#button-image').prop('disabled', false);
                        },
                        success: function(html) {
                            $('body').append('<div id="modal-image" class="modal">' + html + '</div>');

                            $('#modal-image').modal('show');
                        }
                    });
                }*/

    function addImage() {
        html  = '<tr id="image-row' + image_row + '">';
        html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
        html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger">Удалить фото</button></td>';
        html += '</tr>';

        $('#images tbody').append(html);

        image_row++;
    }
    //--></script>
<script type="text/javascript"><!--
    var recurring_row = <?php echo $recurring_row; ?>;

    function addRecurring() {
        html  = '<tr id="recurring-row' + recurring_row + '">';
        html += '  <td class="left">';
        html += '    <select name="product_recurring[' + recurring_row + '][recurring_id]" class="form-control">>';
        <?php foreach ($recurrings as $recurring) { ?>
            html += '      <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>';
            <?php } ?>
        html += '    </select>';
        html += '  </td>';
        html += '  <td class="left">';
        html += '    <select name="product_recurring[' + recurring_row + '][customer_group_id]" class="form-control">>';
        <?php foreach ($customer_groups as $customer_group) { ?>
            html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
            <?php } ?>
        html += '    <select>';
        html += '  </td>';
        html += '  <td class="left">';
        html += '    <a onclick="$(\'#recurring-row' + recurring_row + '\').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></a>';
        html += '  </td>';
        html += '</tr>';

        $('#tab-recurring table tbody').append(html);

        recurring_row++;
    }
    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });
    //--></script>
<script type="text/javascript"><!--
    $('#language a:first').tab('show');
    $('#option a:first').tab('show');
    //--></script></div>


<?php /* javascript for bootstrap select */ ?>
<script src="view/javascript/bootstrap-select.min.js"></script>
<script src="view/javascript/jquery.chained.js"></script>
<script>
    $(document).ready(function() { //
        $('.selectpicker').selectpicker();
    });
</script>
<script>
    $(document).ready(function() {
        var moreAuto = 1;
        if($("div").is(".addMoreSection")){
            if($('.addMoreSection').html().trim() !== ''){
                $('.removeMoreProduct').css('display', 'block');
                moreAuto = parseInt($('.addMoreSection').find('.bootstrap-select').length) + 1;
            }
            $('.removeMoreProduct').on('click', function(){
                if ($('.addMoreSection').find('.bootstrap-select').length > 0) {
                    $('.addMoreSection').find('.bootstrap-select').last().remove();
                    moreAuto--;
                    if(moreAuto == 1){
                        $('.removeMoreProduct').css('display', 'none');
                    }
                }
            });

            /*$('.addMoreProduct').on('click', function(){
              if(moreAuto <= 6){
                $('#main_category_id').clone().addClass('addMoreSection'+moreAuto).appendTo('.addMoreSection');
                $(".addMoreSection"+moreAuto).prop("name", "main_category_dop[]");
                $(".addMoreSection"+moreAuto).selectpicker('refresh');
                $('.removeMoreProduct').css('display', 'block');

                moreAuto++;
              } else{
                alert('Ограничение в 6 штук!');
              }
            });*/
        }
    });
</script>

<?php echo $footer; ?>
