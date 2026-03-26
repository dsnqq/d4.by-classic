<?php echo $header; ?>
<?php require_once $_SERVER['DOCUMENT_ROOT'].'/admin/product_config.php';?>
<?php include $_SERVER['DOCUMENT_ROOT'] . '/admin/view/template/catalog/aqe/modal/product_list_confirm_delete.tpl'; ?>

<?php if (in_array("image", $columns) || in_array("images", $actions)) { ?>
    <div class="modal fade" id="modal-image" tabindex="-1" role="dialog" aria-hidden="true"></div>
<?php } ?>

<?php include $_SERVER['DOCUMENT_ROOT'] . '/admin/view/template/catalog/aqe/modal/product_list_aqe_menu.tpl'; ?>

<?php echo $column_left; ?>
<div id="content">
    <?php
        $columns = array_values(array_filter((array)$columns, function ($c) { return $c !== 'selector'; }));
        $colspan_total = count($columns) + (in_array('status', $columns, true) ? 1 : 0);
    ?>
    <div class="page-header">
        <div class="container-fluid">
            <ul class="breadcrumb bull5i-breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li<?php echo ($breadcrumb['active']) ? ' class="active"' : ''; ?>><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
            <div class="navbar-placeholder">
                <nav class="navbar navbar-bull5i" role="navigation" id="bull5i-navbar">
                    <div class="nav-container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bull5i-navbar-collapse">
                                <span class="sr-only"><?php echo $text_toggle_navigation; ?></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <h1 class="bull5i-navbar-brand"><i class="fa fa-cubes fa-fw ext-icon"></i> <?php echo $heading_title; ?></h1> <span style="font-size: 18px;font-weight: bold;line-height: 39px;">Всего: <?php echo $all_product_count; ?> штук
                                <?php if(strpos($_SERVER['REQUEST_URI'],'filter_') === false){ ?>
                                <span>(<span style="color:green;">активные: <?php echo $active_product=(int)$all_product_count-(int)$all_product_count_status_false;?></span>, <span style="color:red;">неактивные: <?php echo $all_product_count_status_false; ?></span>)</span>
                                <?php } ?>
							</span>
                        </div>
                        <div class="collapse navbar-collapse" id="bull5i-navbar-collapse">
                            <div class="navbar-right">
                                <div class="nav navbar-nav navbar-checkbox hidden" id="batch-edit-container">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" id="batch-edit"<?php echo ($batch_edit) ? ' checked': ''; ?>> <?php echo $text_batch_edit; ?>
                                        </label>
                                    </div>
                                </div>
                                <div class="nav navbar-nav btn-group">
                                    <?php if( $user_id_com != 25 ){ ?>
                                    <button type="button" class="btn btn-primary" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_add; ?>" data-url="<?php echo $add; ?>" id="btn-insert" data-form="#pqe-list-form" data-context="#content"><i class="fa fa-plus"></i> <span class="visible-lg-inline visible-xs-inline">Добавить запчасть</span></button>
                                    <button type="button" class="btn btn-danger" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_delete; ?>" data-url="<?php echo $delete; ?>" id="btn-delete" data-form="#pqe-list-form" data-context="#content" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <?php echo $text_deleting; ?>" disabled><i class="fa fa-trash-o"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_delete; ?></span></button>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>

    <div class="alerts">
        <div class="container-fluid" id="alerts">
            <?php foreach ($alerts as $type => $_alerts) { ?>
            <?php foreach ((array)$_alerts as $alert) { ?>
            <?php if ($alert) { ?>
            <div class="alert alert-<?php echo ($type == "error") ? "danger" : $type; ?> fade in">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <i class="fa <?php echo $alert_icon($type); ?>"></i><?php echo $alert; ?>
        </div>
        <?php } ?>
        <?php } ?>
        <?php } ?>
    </div>
</div>
<div class="container-fluid bull5i-content bull5i-container">
    <form method="post" enctype="multipart/form-data" id="pqe-list-form" class="form-horizontal" role="form">
        <fieldset>
            <div class="table-responsive">
                <table cellpadding="0" cellspacing="0" border="0" class="table table-bordered table-condensed<?php echo ($aqe_row_hover_highlighting) ? ' table-hover' : ''; ?><?php echo ($aqe_alternate_row_colour) ? ' table-striped' : ''; ?>" id="dT">
                    <thead>
                    <tr>
                        <?php foreach ($columns as $col) {
								 switch($col) {
									case 'selector': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?> col_<?php echo $col; ?>" width="1"><input type="checkbox" id="global-selector" /></th>
                        <?php break;
									case 'image': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?> col_<?php echo $col; ?>" width="1"><?php echo $column_info[$col]['name']; ?></th>
                        <?php break; ?>
                        <?php case 'category': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?> col_<?php echo $col; ?>"><a href="<?php echo $sorts[$col]; ?>"<?php echo ($sort == $column_info[$col]['sort']) ? ' class="' . strtolower($order) . '"' : ''; ?>><?php echo $column_info[$col]['name']; ?></a></th>
                        <?php break; ?>
                        <?php case 'price': ?>
                        <?php if (!empty($column_info[$col]['sort'])) { ?>
                            <th style="width:66px;" class="<?php echo $column_info[$col]['align']; ?> col_<?php echo $col; ?>"><a href="<?php echo $sorts[$col]; ?>"<?php echo ($sort == $column_info[$col]['sort']) ? ' class="' . strtolower($order) . '"' : ''; ?>><?php echo $column_info[$col]['name']; ?></a></th>
                        <?php } else { ?>
                            <th style="width:66px;" class="<?php echo $column_info[$col]['align']; ?> col_<?php echo $col; ?>"><?php echo $column_info[$col]['name']; ?></th>
                        <?php } ?>
                        <?php break; ?>
                        <?php default: ?>
                        <?php if($col == "status"){ ?>
                        <?php if (!empty($column_info[$col]['sort'])) { ?>
                            <th class="<?php echo $column_info[$col]['align']; ?> col_<?php echo $col; ?>"><a href="<?php echo $sorts[$col]; ?>"<?php echo ($sort == $column_info[$col]['sort']) ? ' class="' . strtolower($order) . '"' : ''; ?>><?php echo $column_info[$col]['name']; ?></a></th>
                        <?php } else { ?>
                            <th class="<?php echo $column_info[$col]['align']; ?> col_<?php echo $col; ?>"><?php echo $column_info[$col]['name']; ?></th>
                        <?php } ?>
                            <th class="text-right col_description">Описание</th>
                        <?php } else{ ?>
                        <?php if (!empty($column_info[$col]['sort'])) { ?>
                            <th class="<?php echo $column_info[$col]['align']; ?> col_<?php echo $col; ?>"><a href="<?php echo $sorts[$col]; ?>"<?php echo ($sort == $column_info[$col]['sort']) ? ' class="' . strtolower($order) . '"' : ''; ?>><?php echo $column_info[$col]['name']; ?></a></th>
                        <?php } else { ?>
                            <th class="<?php echo $column_info[$col]['align']; ?> col_<?php echo $col; ?>"><?php echo $column_info[$col]['name']; ?></th>
                        <?php } ?>
                        <?php } ?>
                        <?php break;
								 } ?>
                        <?php } ?>
                    </tr>
                    <tr class="filters">
                        <?php foreach ($columns as $col) {
								 switch($col) {
									case 'view_in_store':
									case 'selector': ?>
                        <th></th>
                        <?php break;
									case 'status': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>">
                            <select name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>">
                                <option value="">Все объявления</option>
                                <option value="1"<?php echo ($filters[$col]) ? ' selected' : ''; ?>><?php echo $text_enabled; ?></option>
                                <option value="0"<?php echo (!is_null($filters[$col]) && !$filters[$col]) ? ' selected' : ''; ?>><?php echo $text_disabled; ?></option>
                            </select>
                        </th>
                        <th></th>
                        <?php break;
									case 'image':
									case 'subtract':
									case 'requires_shipping': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>">
                            <select name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>">
                                <option value=""></option>
                                <option value="1"<?php echo ($filters[$col]) ? ' selected' : ''; ?>><?php echo $text_yes; ?></option>
                                <option value="0"<?php echo (!is_null($filters[$col]) && !$filters[$col]) ? ' selected' : ''; ?>><?php echo $text_no; ?></option>
                            </select>
                        </th>
                        <?php break;
									case 'action': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>">
                            <div class="">
                                <button type="button" class="btn btn-sm btn-default" id="filter" data-toggle="tooltip" data-container="body" title="<?php echo $text_filter; ?>">Поиск</button>
                                <br><button type="button" class="btn btn-sm btn-default" id="clear-filter" data-toggle="tooltip" data-container="body" title="<?php echo $text_clear_filter; ?>">Сброс</button>
                            </div>
                        </th>
                        <?php break;
									case 'manufacturer': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>" style="position:relative;">
                            <span class="select2-selection__clear"><span>Очистить </span>×</span>
                            <select name="filter_<?php echo $col; ?>" class="same_pick form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>" data-live-search="true">
                                <option value=""<?php echo (!is_null($filters[$col]) && $filters[$col] == '*') ? ' selected' : ''; ?>><?php echo $text_none; ?></option>
                                <?php foreach ($manufacturers as $m) { ?>
                                <option value="<?php echo $m['manufacturer_id']; ?>"<?php echo (!is_null($filters[$col]) && $m['manufacturer_id'] == $filters[$col]) ? ' selected' : ''; ?>><?php echo $m['name']; ?></option>
                                <?php } ?>
                            </select>
                        </th>
                        <?php break;
									case 'category': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>" style="position:relative;">
                            <span class="select2-selection__clear"><span>Очистить </span>×</span>
                            <select name="filter_<?php echo $col; ?>" class="same_pick form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>" data-live-search="true">
                                <option value=""<?php echo (!is_null($filters[$col]) && $filters[$col] == '*') ? ' selected' : ''; ?>><?php echo $text_none; ?></option>
                                <?php foreach ($categories as $c) { ?>
                                <option value="<?php echo $c['category_id']; ?>"<?php echo (!is_null($filters[$col]) && $c['category_id'] == $filters[$col]) ? ' selected' : ''; ?>><?php echo $c['name']; ?></option>
                                <?php } ?>
                            </select>
                        </th>
                        <?php break;
									case 'download': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>">
                            <select name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>">
                                <option value=""></option>
                                <option value="*"<?php echo (!is_null($filters[$col]) && $filters[$col] == '*') ? ' selected' : ''; ?>><?php echo $text_none; ?></option>
                                <?php foreach ($downloads as $dl) { ?>
                                <option value="<?php echo $dl['download_id']; ?>"<?php echo (!is_null($filters[$col]) && $dl['download_id'] == $filters[$col]) ? ' selected' : ''; ?>><?php echo $dl['name']; ?></option>
                                <?php } ?>
                            </select>
                        </th>
                        <?php break;
									case 'filter': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>">
                            <select name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>">
                                <option value=""></option>
                                <option value="*"<?php echo (!is_null($filters[$col]) && $filters[$col] == '*') ? ' selected' : ''; ?>><?php echo $text_none; ?></option>
                                <?php foreach ($_filters as $fg) { ?>
                                <optgroup label="<?php echo addslashes($fg['name']); ?>">
                                    <?php foreach ($fg['filters'] as $f) { ?>
                                    <option value="<?php echo $f['filter_id']; ?>"<?php echo (!is_null($filters[$col]) && $f['filter_id'] == $filters[$col]) ? ' selected' : ''; ?>><?php echo $f['name']; ?></option>
                                    <?php } ?>
                                </optgroup>
                                <?php } ?>
                            </select>
                        </th>
                        <?php break;
									case 'store': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>">
                            <select name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>">
                                <option value=""></option>
                                <option value="*"<?php echo (!is_null($filters[$col]) && $filters[$col] == '*') ? ' selected' : ''; ?>><?php echo $text_none; ?></option>
                                <?php foreach ($stores as $store_id => $s) { ?>
                                <option value="<?php echo $store_id; ?>"<?php echo (!is_null($filters[$col]) && (string)$store_id == $filters[$col]) ? ' selected' : ''; ?>><?php echo $s['name']; ?></option>
                                <?php } ?>
                            </select>
                        </th>
                        <?php break;
									case 'length_class': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>" >
                            <select name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>">
                                <option value=""></option>
                                <?php foreach ($length_classes as $lc) { ?>
                                <option value="<?php echo $lc['length_class_id']; ?>"<?php echo (!is_null($filters[$col]) && $lc['length_class_id'] == $filters[$col]) ? ' selected' : ''; ?>><?php echo $lc['title']; ?></option>
                                <?php } ?>
                            </select>
                        </th>
                        <?php break;
									case 'weight_class': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>">
                            <select name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>">
                                <option value=""></option>
                                <?php foreach ($weight_classes as $wc) { ?>
                                <option value="<?php echo $wc['weight_class_id']; ?>"<?php echo (!is_null($filters[$col]) && $wc['weight_class_id'] == $filters[$col]) ? ' selected' : ''; ?>><?php echo $wc['title']; ?></option>
                                <?php } ?>
                            </select>
                        </th>
                        <?php break;
									case 'stock_status': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>">
                            <select name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>">
                                <option value=""></option>
                                <?php foreach ($stock_statuses as $ss) { ?>
                                <option value="<?php echo $ss['stock_status_id']; ?>"<?php echo (!is_null($filters[$col]) && $ss['stock_status_id'] == $filters[$col]) ? ' selected' : ''; ?>><?php echo $ss['name']; ?></option>
                                <?php } ?>
                            </select>
                        </th>
                        <?php break;
									case 'tax_class': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>">
                            <select name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>">
                                <option value="" selected></option>
                                <option value="*"<?php echo (!is_null($filters[$col]) && $filters[$col] == '*') ? ' selected' : ''; ?>><?php echo $text_none; ?></option>
                                <?php foreach ($tax_classes as $tc) { ?>
                                <option value="<?php echo $tc['tax_class_id']; ?>"<?php echo (!is_null($filters[$col]) && $tc['tax_class_id'] == $filters[$col]) ? ' selected' : ''; ?>><?php echo $tc['title']; ?></option>
                                <?php } ?>
                            </select>
                        </th>
                        <?php break;
									case 'price': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>" style="font-weight:bold;">Цена</th>
                        <?php break;

									case 'length':
									?>
                        <th style="position:relative;">
                            <?php $filter_length_ex = explode("<=", $_GET['filter_length']); ?>
                            <div style="display: flex;align-items: center;">
                                <div id="filter_yeaerChangeTh">
                                    <select id="filter_yeaerChange" name="filter_<?php echo $col; ?>" class="form-control selectpicker" data-live-search="true">
                                        <option value="" <?php echo (is_null($filter_length_ex[0])) ? "selected='selected'" : "" ; ?>>Год</option>
                                        <?php $year_max = date('Y');$year_max = (int)$year_max; ?>
                                        <?php for($year_iteration = 1980; $year_iteration <= $year_max; $year_iteration++){ ?>
                                        <option value="<?php echo $year_iteration; ?>"  <?php echo ($filter_length_ex[0] == $year_iteration) ? "selected='selected'" : "" ; ?>><?php echo $year_iteration; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div>-</div>
                                <div id="filter_yeaerChangeTh1">
                                    <select id="filter_yeaerChange1" name="filter_<?php echo $col; ?>1" class="form-control selectpicker" data-live-search="true">
                                        <option value="" <?php echo (is_null($filter_length_ex[1])) ? "selected='selected'" : "" ; ?>>Год</option>
                                        <?php $year_max = date('Y');$year_max = (int)$year_max; ?>
                                        <?php for($year_iteration = 1980; $year_iteration <= $year_max; $year_iteration++){ ?>
                                        <option value="<?php echo $year_iteration; ?>"  <?php echo ($filter_length_ex[1] == $year_iteration) ? "selected='selected'" : "" ; ?>><?php echo $year_iteration; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <input id="filter_yeaerChangeData" style="position:absolute;left:-9999999px;opacity:0;" type="text" name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>" value="<?php echo !is_null($filters[$col]) ? $filters[$col] : ''; ?>">
                        </th>
                        <?php
									break;
									case 'name':
									case 'sku':
									case 'upc':
									case 'ean':
									case 'mpn':
									case 'location':
									case 'seo': ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>"><input type="text" name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?> typeahead" placeholder="<?php echo $text_autocomplete; ?>" value="<?php echo !is_null($filters[$col]) ? $filters[$col] : ''; ?>" data-column="<?php echo $col; ?>"></th>
                        <?php break;
									case 'model':
									?>
                        <th style="position:relative;" class="<?php echo $column_info[$col]['align']; ?>"><span class="select2-selection__clear"><span>Очистить </span>×</span><input type="text" name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?> typeahead" placeholder="<?php echo $text_autocomplete; ?>" value="<?php echo !is_null($filters[$col]) ? $filters[$col] : ''; ?>" data-column="<?php echo $col; ?>"></th>

                        <?php break;
									case 'isbn':
									?>
                        <th class="<?php echo $column_info[$col]['align']; ?>">
                            <select  class=" form-control input-sm isbn_toplivo fltr <?php echo $col; ?> typeahead" data-column="<?php echo $col; ?>">
                                <option value="*"<?php echo (is_null($filters[$col])) ? ' selected' : ''; ?>>--- Не выбрано ---</option>
                                <option value="дизель"<?php echo (!is_null($filters[$col]) && 'дизель' == $filters[$col]) ? ' selected' : ''; ?>>дизель</option>
                                <option value="бензин"<?php echo (!is_null($filters[$col]) && 'бензин' == $filters[$col]) ? ' selected' : ''; ?>>бензин</option>
                                <option value="гибрид"<?php echo (!is_null($filters[$col]) && 'гибрид' == $filters[$col]) ? ' selected' : ''; ?>>гибрид</option>
                                <option value="электро"<?php echo (!is_null($filters[$col]) && 'электро' == $filters[$col]) ? ' selected' : ''; ?>>электро</option>
                            </select>
                            <input type="text" class="fltr" id="isbn_toplivo" name="filter_<?php echo $col; ?>" style="opacity:0;position:absolute;left:-999999px;" value="<?php echo !is_null($filters[$col]) ? $filters[$col] : ''; ?>" data-column="<?php echo $col; ?>">
                        </th>
                        <?php break;
									case 'jan':
									?>
                        <th style="position:relative;" class="<?php echo $column_info[$col]['align']; ?>"><span class="select2-selection__clear"><span>Очистить </span>×</span><input type="text" name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?> typeahead" placeholder="<?php echo $text_autocomplete; ?>" value="<?php echo !is_null($filters[$col]) ? $filters[$col] : ''; ?>" data-column="<?php echo $col; ?>"></th>

                        <?php break; default: ?>
                        <th class="<?php echo $column_info[$col]['align']; ?>"><input type="text" name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>" value="<?php echo !is_null($filters[$col]) ? $filters[$col] : ''; ?>"></th>
                        <?php break;
								 } ?>
                        <?php } ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php if ($products) { ?>
                    <?php foreach ($products as $product) { ?>
                    <tr>
                        <?php foreach($columns as $col) {
									switch ($col) {
											case 'selector': ?>
                        <td style="width:1px" class="text-center">
                            <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>"<?php if ($product['selected']) { ?> checked <?php } ?>/>
                        </td>
                        <?php break;
											case 'image': ?>
                        <td style="display: grid;grid-template-columns: 1fr 1fr 1fr;min-width:170px;"class="<?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>">
                        <div style=" grid-column: 1 / -1;">
                            <a data-lightbox="image<?php echo $product['product_id']; ?>" href="https://d4.by/image/<?php echo $product['thumb']; ?>">
                                <img src="<?php echo $product['thumb_mini']; ?>" width="150px" class="img-thumbnail" data-id="<?php echo $product['product_id']; ?>" data-image="<?php echo $product['image']; ?>" />
                            </a>
                        </div>
                        <?php foreach($product['images'] as $images__itm){ ?>
                        <?php if($images__itm['image'] != $product['thumb']){ ?>
                        <a data-lightbox="image<?php echo $product['product_id']; ?>" href="https://d4.by/image/<?php echo $images__itm['image']; ?>">
                            <img src="<?php echo $images__itm['thumb']; ?>" width="50px" class="img-thumbnail" data-id="<?php echo $product['product_id']; ?>" data-image="/image/<?php echo $product['image']; ?>" />
                        </a>
                        <?php } ?>
                        <?php } ?>
                        </td>
                        <?php break;
											case 'view_in_store': ?>
                        <td class="view_store <?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>">
                            <select onchange="((this.value !== '') ? window.open(this.value) : null); this.value = '';">
                                <option value=""><?php echo $text_select; ?></option>
                                <?php foreach ($product[$col] as $store) { ?>
                                <option value="<?php echo $store['href']; ?>"><?php echo $store['name']; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                        <?php break;
											case 'action': ?>
                        <td class="<?php echo $column_info[$col]['align']; ?> action">

                            <?php if( $user_id_com != 25 ){ ?>
                            <div class="btn-group btn-group-flex">
                                <a data-productinfo="Артикул: <?php echo $product['modelQR']; ?>" data-productid="<?php echo $product['product_id']; ?>" style="display: flex;align-items: center;border: 1px solid #ccc;" class="btn-default btn-xs historyProduct">
                                    <i class="fa fa-archive"></i>
                                    <?php if($product['change']){ ?>
                                    <span style="margin-left: 2px;"> <?php echo count($product['change']); ?></span>
                                    <?php } ?>
                                </a>
                                <a style="display: flex;align-items: center;" class="btn-default btn-xs btn-danger deletedButton" href="https://d4.by/admin/index.php?route=catalog/product/deleted&amp;product_id=<?php echo $product['product_id']; ?>&amp;token=<?php echo $token; ?><?php echo $product['url_deleted']; ?>"><i class="fa fa-trash-o"></i></a>
                                <a data-productid="<?php echo $product['product_id']; ?>" style="display: flex;align-items: center;border: 1px solid #ccc;" class="btn-default btn-xs addPhotoButton"><i class="fa fa-camera"></i></a>

                                <?php foreach ($product['action'] as $action) { ?>
                                <?php if ($action['url']) { ?>
                                <a href="<?php echo $action['url']; ?>" <?php echo ($action['type'] == 'view') ? "target='_blank'" : ""; ?> class="btn btn-default btn-xs <?php echo $action['type']; ?> <?php echo $action['class']; ?>" id="<?php echo $action['action'] . "-" . $product['product_id']; ?>" data-toggle="tooltip" data-container="body" title="<?php echo $action['title']; ?>"><i class="fa fa-<?php echo $action['icon']; ?>"></i><?php echo $action['name']; ?></a>
                                <?php } else { ?>
                                <button type="button" class="btn btn-default btn-xs action <?php echo $action['type']; ?> <?php echo $action['class']; ?>" id="<?php echo $action['action'] . "-" . $product['product_id']; ?>" data-toggle="tooltip" data-container="body" title="<?php echo $action['title']; ?>" data-column="<?php echo $action['action']; ?>"<?php echo ($action['rel']) ? ' data-rel="' . $action['rel'] . '"' : ''; ?>><?php if ($action['icon']) { ?><i class="fa fa-<?php echo $action['icon']; ?>"></i><?php } ?><?php echo $action['name']; ?></button>
                                <?php } ?>
                                <?php } ?>
                            </div><br>
                            <?php if($product['viewers'] != 0){ ?>
                                <div data-toggle="tooltip" title data-original-title="Все просмотры" class="viewsDataAndTime" data-views="<?php echo implode(',', $product['view_date_list']); ?>" style="font-size:11px;margin-top:10px;text-align:center;border-bottom: 1px solid;cursor: pointer;">Кол-во просмотров: <?php echo $product['viewers']; ?></div>
                            <?php }else{ ?>
                                <div style="font-size:11px;margin-top:10px;text-align:center;">Кол-во просмотров: <?php echo $product['viewers']; ?></div>
                            <?php } ?>
                            <br>
                            <?php }  else { ?>
                            <?php foreach ($product['action'] as $action) { ?>
                            <?php if ($action['type'] == 'view') { ?>
                            <a style="display: block;" href="<?php echo $action['url']; ?>" <?php echo ($action['type'] == 'view') ? "target='_blank'" : ""; ?> class="btn btn-default btn-xs <?php echo $action['type']; ?> <?php echo $action['class']; ?>" id="<?php echo $action['action'] . "-" . $product['product_id']; ?>" data-toggle="tooltip" data-container="body" title="<?php echo $action['title']; ?>"><i class="fa fa-<?php echo $action['icon']; ?>"></i><?php echo $action['name']; ?></a>
                            <br>
                            <?php } ?>
                            <?php } ?>
                            <?php } ?>

                            <?php include $_SERVER['DOCUMENT_ROOT'] . '/admin/view/template/catalog/aqe/inc/product_list_qr_code_btn.php'; ?>

            </td>
            <?php break; ?>
            <?php case 'status': ?>
            <td <?php echo ($product[$col] == 'Активно') ? 'style="background:#23b423;color:#000;font-weight:bold;"' : 'style="color:#000;background:red;font-weight:bold;"'; ?> data-id="<?=$product['product_id']?>" class="

            <?php if( $user_id_com != 25 ){ ?>
            status_favourite
            <?php } ?>
            <?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>"
            id="<?php echo $col . "-" . $product['product_id']; ?>"><?php echo $product[$col]; ?></td>
            <td style="max-width:150px;"><?php echo $product['description']; ?>
                <?php if($product['zametka']){ ?>
                <?php foreach($product['zametka'] as $zametka){ ?>
                <?php if($zametka['attribute_id'] == 12 && $zametka['product_attribute_description'][1]['text']!= ''){ ?>
                <br><div style="color:#ff0000;">Заметка: <?php echo $zametka['product_attribute_description'][1]['text']; ?></div>
                <?php } ?>
                <?php } ?>
                <?php } ?>
            </td>
            <?php break; ?>
            <?php case 'category': ?>
            <td style="line-height: 22px;font-weight:bold;" class="<?php echo $column_info[$col]['align']; ?>
										<?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>">
            <?php echo $product[$col]; ?>
            <?php if($product['version'] != ""){ ?>
            <div style="font-weight: 500;">(<?php echo $product['version']; ?>)</div>
            <?php } ?>
            <div style="font-size: 11px;">
                <span><?php echo $product['location']; ?></span>
                <?php if($product['width'] != "" && $product['width'] != 0){ ?>
                <span> <?php echo $product['width']; ?>j; </span>
                <?php } ?>
                <?php if($product['height'] != "" && $product['height'] != 0){ ?>
                <span style="margin-right: -4px;"><?php echo $product['height']; ?>-</span>
                <?php } ?>
                <?php if($product['weight'] != "" && $product['weight'] != 0){ ?>
                <span><?php echo $product['weight']; ?>; </span>
                <?php } ?>
                <?php if($product['etvylet'] != "" && $product['etvylet'] != 0){ ?>
                <span>ET-<?php echo $product['etvylet']; ?>; </span>
                <?php } ?>
                <?php if($product['diadiametr'] != "" && $product['diadiametr'] != 0){ ?>
                <span>DIA-<?php echo $product['diadiametr']; ?></span>
                <?php } ?>
                <?php if($product['ean'] != ""){ ?>
                <span><?php echo $product['ean']; ?></span>
                <?php } ?>
                <?php if($product['upc'] != ""){ ?>
                <div style="font-weight: 500;"><?php echo $product['upc']; ?></div>
                <?php } ?>
            </div>
            </td>
            <?php break; ?>
            <?php case 'price': ?>
            <td data-text="<?php echo $product['price_BYN'];?>&#10;<?php echo $product['price_RUB'];?>" class="price_BYN<?php echo $product['product_id']; ?> <?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>">
                        <?php echo $product[$col]; ?>
            </td>
            <style>
                .price_BYN<?php echo $product['product_id']; ?>:after{
                    content: attr(data-text);
                    font-size:13px;
                    display: block;
                }
            </style>
            <?php break; ?>
            <?php case 'isbn': ?>
            <td class="<?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>"><?php echo $product[$col]; ?> <?php echo $product['mpn']; ?></td>
            <?php break; ?>
            <?php case 'manufacturer': ?>
            <td style="font-weight:bold;" class="<?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>"><?php echo $product[$col]; ?></td>

            <?php break; ?>

            <?php case 'date_added': ?>
            <td class="<?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>"><?php echo $product[$col]; ?><?php if($product['change'][count($product['change'])-1]['value_name'] != "Добавил З/Ч" && $product['change'][count($product['change'])-1]['data_change'] != "" && $product['change'][count($product['change'])-1]['data_change']){ ?><br><span style="font-size:10px;">Последнее изменение:</span><br><?php $date2 = new DateTime($product['change'][count($product['change'])-1]['data_change']); echo $date2->format('d-m-Y H:i:s'); ?><?php } ?></td>
            <?php break; ?>

            <?php case 'sku': ?>
            <td class="<?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?> sku_qe_br" id="<?php echo $col . "-" . $product['product_id']; ?>"><?php echo $product[$col]; ?></td>
            <?php break; ?>
            <?php default: ?>
            <td class="<?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>"><?php echo $product[$col]; ?></td>
            <?php break;
									}
								} ?>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
                <td class="text-center" colspan="<?php echo (int)$colspan_total; ?>"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
            </tbody>
            </table>
</div>
</fieldset>
</form>
<div class="row">
    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>
</div>
</div>
<iframe name="imgFrame" style="width: 0; height: 0; border: 0;color:#fff;"></iframe>
<style>
    :root{
        --aqe-bg: #f6f7fb;
        --aqe-card: #ffffff;
        --aqe-text: #111827;
        --aqe-muted: #6b7280;
        --aqe-border: #e5e7eb;
        --aqe-border-strong: #d1d5db;
        --aqe-shadow: 0 10px 25px rgba(17,24,39,.08);
        --aqe-shadow-sm: 0 2px 8px rgba(17,24,39,.08);
        --aqe-radius: 12px;
        --aqe-radius-sm: 10px;
        --aqe-focus: rgba(59,130,246,.18);
    }
    body{
        color: var(--aqe-text);
    }

    /* Header / navbar */
    .page-header{
        background: transparent;
        border-bottom: 0;
    }
    .navbar-placeholder{
        border-radius: var(--aqe-radius);
        background: var(--aqe-card);
    }
    .navbar.navbar-bull5i{
        background: var(--aqe-card);
        border: 0;
    }
    .bull5i-navbar-brand{
        font-weight: 700;
        letter-spacing: .2px;
    }
    .alerts .alert{
        border-radius: var(--aqe-radius-sm);
        box-shadow: var(--aqe-shadow-sm);
        border: 1px solid var(--aqe-border);
    }

    /* Main container */
    .bull5i-container{
        background: var(--aqe-card);
        border-radius: var(--aqe-radius);
        box-shadow: var(--aqe-shadow);
        padding-top: 14px;
        padding-bottom: 14px;
    }

    /* Table look */
    #dT{
        border: 1px solid var(--aqe-border);
        border-radius: var(--aqe-radius);
        background: #fff;
    }
    #dT > thead > tr > th{
        background: #fafafa;
        border-bottom: 1px solid var(--aqe-border);
        color: #111827;
        font-weight: 700;
        vertical-align: middle;
        white-space: nowrap;
    }
    #dT > tbody > tr > td{
        border-top: 1px solid var(--aqe-border);
        vertical-align: middle;
    }
    #dT.table-hover > tbody > tr:hover{
        background: #f9fafb;
    }

    .table-responsive{
        border: 0;
    }

    /* Filters */
    #dT thead tr.filters{
        box-shadow: 0 10px 18px rgba(17,24,39,.06);
    }
    #dT thead tr.filters .form-control{
        border-radius: 10px;
        border: 0 !important;
        box-shadow: none !important;
        outline: none !important;
        transition: border-color .12s ease;
        background: rgba(17,24,39,.04);
    }
    #dT thead tr.filters .form-control:focus{
        border-color: transparent;
        box-shadow: none !important;
        outline: none !important;
    }
    /* Text inputs (typeahead) should still look like inputs */
    #dT thead tr.filters input.form-control.typeahead{
        background: #fff;
        border: 1px solid var(--aqe-border) !important;
    }
    #dT thead tr.filters input.form-control.typeahead:focus{
        border-color: var(--aqe-border-strong) !important;
    }
    #dT thead tr.filters th{
        padding-top: 10px;
        padding-bottom: 10px;
    }
    .select2-selection__clear{
        display: inline-flex;
        align-items: center;
        gap: 6px;
        position: absolute;
        right: 8px;
        top: 8px;
        font-size: 12px;
        color: var(--aqe-muted);
        background: transparent;
        border: 0;
        border-radius: 999px;
        padding: 2px 6px;
        cursor: pointer;
        user-select: none;
        opacity: .85;
    }
    .select2-selection__clear:hover{
        opacity: 1;
        text-decoration: underline;
    }
    .same_pick{
        padding-right: 92px; /* space for "Очистить" pill */
    }

    /* Filter buttons */
    #filter, #clear-filter{
        width: 100%;
        border-radius: 12px;
        font-weight: 800;
        font-size: 14px !important;
        letter-spacing: .2px;
        border: 1px solid var(--aqe-border);
        box-shadow: var(--aqe-shadow-sm);
        padding: 10px 12px;
    }
    #filter{
        background: #16a34a !important;
        color: #fff !important;
        border-color: rgba(22,163,74,.25);
    }
    #clear-filter{
        background: #f59e0b !important;
        color: #111827 !important;
        border-color: rgba(245,158,11,.25);
        margin-top: 8px;
    }

    /* Buttons in toolbar and rows */
    .btn{
        border-radius: 12px;
    }
    .btn-xs{
        border-radius: 10px;
    }
    .btn-group-flex{
        display: inline-flex;
        flex-wrap: wrap;
        gap: 4px;
        align-items: center;
    }
    .btn-group-flex > a,
    .btn-group-flex > button{
        border-radius: 10px;
        border: 1px solid var(--aqe-border) !important;
        box-shadow: none !important;
        height: 26px;
        line-height: 24px;
        padding: 0 8px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 6px;
        box-sizing: border-box;
    }
    /* "Flat" look for the custom action links in the group */
    .btn-group-flex > a.btn-default,
    .btn-group-flex > button.btn-default{
        background: #fff !important;
        color: #111827 !important;
    }
    .btn-group-flex > a.btn-default:hover,
    .btn-group-flex > button.btn-default:hover{
        background: #f9fafb !important;
        border-color: var(--aqe-border-strong) !important;
    }
    /* Remove odd borders from inline-styled links inside the group */
    .btn-group-flex > a[style*="border"],
    .btn-group-flex > a[style*="border:"]{
        border: 1px solid var(--aqe-border) !important;
    }

    /* Ensure all "btn-default btn-xs" links look consistent (some are <a> without .btn) */
    .btn-group-flex > a.btn-default.btn-xs,
    .btn-group-flex > a.btn-default{
        text-decoration: none;
        border-radius: 10px !important;
    }
    .btn-group-flex > a.btn-default i,
    .btn-group-flex > button.btn-default i{
        margin: 0;
    }

    /* Keep complex cells top-aligned */
    td.col_image,
    td.col_category,
    td.col_description{
        vertical-align: top !important;
    }

    /* Images cell */
    td.col_image{
        background: #fff;
    }
    td.col_image .img-thumbnail{
        border-radius: 12px;
        border: 1px solid var(--aqe-border);
        box-shadow: var(--aqe-shadow-sm);
    }

    /* Status cell: reduce harsh colors a bit */
    td.status_favourite{
        border-left: 4px solid rgba(17,24,39,.15);
    }

    .text-left.col_category{
        min-width:170px;
    }
    .text-left.col_manufacturer{
        min-width:170px;
    }
    .bootstrap-select .dropdown-menu{
        right:-80px !important;
    }
    #batch-edit-container{
        display:none !important;
    }
</style>


<div class="modal fade" id="viewsModal" tabindex="-1" role="dialog" aria-labelledby="viewsModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Закрыть"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="viewsModalLabel">Все просмотры</h4>
            </div>
            <div class="modal-body" id="viewsModalBody"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
            </div>
        </div>
    </div>
</div>

<link type="text/css" href="view/stylesheet/bootstrap-select.css" rel="stylesheet" media="screen" />
<script src="view/javascript/bootstrap-select.min.js"></script>
<script src="view/javascript/jquery.chained.js"></script>

<link rel="stylesheet" href="/admin/view/stylesheet/dropzone.css" />
<script src="/admin/view/javascript/dropzone.js"></script>

<?php include $_SERVER['DOCUMENT_ROOT'] . '/admin/view/template/catalog/aqe/modal/product_list_image_upload.tpl'; ?>
<?php include $_SERVER['DOCUMENT_ROOT'] . '/admin/view/template/catalog/aqe/modal/product_list_history.tpl'; ?>

<script src="/admin/view/javascript/product_list_add.js" type="text/javascript"></script>
<link href="/admin/view/stylesheet/product_list_add.css" rel="stylesheet" type="text/css" />

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Находим все элементы с классом viewsDataAndTime
        var viewElements = document.querySelectorAll('.viewsDataAndTime');

        // Добавляем обработчик клика на каждый элемент
        viewElements.forEach(function(element) {
            element.addEventListener('click', function() {
                // Получаем данные из data-атрибута
                var viewsData = this.getAttribute('data-views');
                if (!viewsData) return;

                // Разделяем строку на массив временных меток
                var dates = viewsData.split(',');

                // Форматируем каждую дату с нумерацией
                var formatted = dates.map(function(ts, index) {
                    // Преобразуем timestamp (предполагается, что это Unix timestamp в секундах)
                    var timestamp = parseInt(ts.trim());
                    if (isNaN(timestamp)) return (index + 1) + ') Неверная дата';

                    // Добавляем 3 часа (3*3600 секунд) и преобразуем в миллисекунды
                    var date = new Date((timestamp + 3 * 3600) * 1000);

                    // Форматируем дату в строку YYYY-MM-DD HH:MM:SS
                    var year = date.getFullYear();
                    var month = ('0' + (date.getMonth() + 1)).slice(-2);
                    var day = ('0' + date.getDate()).slice(-2);
                    var hours = ('0' + date.getHours()).slice(-2);
                    var minutes = ('0' + date.getMinutes()).slice(-2);
                    var seconds = ('0' + date.getSeconds()).slice(-2);

                    return (index + 1) + ') ' + year + '-' + month + '-' + day + ' ' +
                        hours + ':' + minutes + ':' + seconds;
                });

                // Находим модальное окно и его тело
                var modalBody = document.getElementById('viewsModalBody');
                var modal = document.getElementById('viewsModal');

                if (modalBody && modal) {
                    // Вставляем отформатированные даты
                    modalBody.innerHTML = formatted.join('<br>');

                    // Показываем модальное окно (используем Bootstrap)
                    if (typeof bootstrap !== 'undefined') {
                        // Bootstrap 5
                        var bsModal = new bootstrap.Modal(modal);
                        bsModal.show();
                    } else if (typeof $ !== 'undefined' && $.fn.modal) {
                        // jQuery Bootstrap (для обратной совместимости)
                        $(modal).modal('show');
                    } else {
                        // Альтернатива без Bootstrap - просто показываем
                        modal.style.display = 'block';
                        modal.classList.add('show');
                    }
                }
            });
        });
    });
</script>

<script type="text/javascript"><!--
    (function(bull5i,$,undefined){
        var related=<?php echo json_encode($related); ?>;bull5i.batch_edit=parseInt("<?php echo (int)$batch_edit; ?>"),bull5i.texts=$.extend({},bull5i.texts,{error_ajax_request:"<?php echo addslashes($error_ajax_request); ?>"}),bull5i.update_image=function(e){var t=e,a=$.Deferred();return $.when($.ajax({url:"index.php?route=common/filemanager&token=<?php echo $token; ?>&target="+encodeURIComponent(t),dataType:"html"})).done(function(e){$("#"+t).val(""),$("#modal-image").append(e),$("#modal-image").modal("show"),$("#modal-image").on("hide.bs.modal",function(){$("#"+t).val()?a.resolve():a.reject(),$("#modal-image").off("hide.bs.modal")}).on("hidden.bs.modal",function(){$("#modal-image").empty(),$("#modal-image").off("hidden.bs.modal")})}).fail(function(){a.reject()}),a.promise()},bull5i.update_related=function(e,t){if(t&&related[e]&&related[e].length){var a={};return $.each(related[e],function(e,r){a[r]=t,$.each(t,function(e,t){$("#"+r+"-"+t)&&bull5i.cell_updating($("#"+r+"-"+t))})}),$.ajax({url:"<?php echo $refresh_url; ?>",type:"POST",cache:!1,dataType:"json",data:{data:a}}).done(function(e){e.error?bull5i.display_alert($("#alerts"),e.error,"error",0,!0):e.values&&$.each(e.values,function(e,t){$.each(t,function(t,a){var r=$("#"+t+"-"+e);r.empty().removeClass("updating").removeAttr("style").editable("enable"),setTimeout(function(){r.html(a)},10)})})}).fail(function(e){var t="string"==typeof e?e:e.responseText||e.statusText||"Unknown error!";bull5i.display_alert($("#alerts"),bull5i.texts.error_ajax_request+" "+t,"error",0,!0)}).always(function(){$("td.updating").each(function(){var e=$(this);e.empty().removeClass("updating").removeAttr("style").editable("enable"),setTimeout(function(){e.html(e.data("original-content"))},10)})}),!0}return!1};
        bull5i.filter=function(){url='index.php?route=catalog/product&token=<?php echo $token; ?>&sort=<?php echo $sort; ?>&order=<?php echo $order; ?>';
                <?php foreach($column_info as $column => $val) { if ($val['filter']['show']) { if ($val['filter']['type'] == 0) { ?>
                var filter_<?php echo $column; ?>=$('input[name=\'filter_<?php echo $column; ?>\']').not(':disabled').val();
                if(filter_<?php echo $column; ?>){url+='&filter_<?php echo $column; ?>='+encodeURIComponent(filter_<?php echo $column; ?>);}
                <?php if ($column == "price") { ?>var filter_special_price=$('input[name=\'filter_special_price\']').val();if(filter_special_price){url+='&filter_special_price='+encodeURIComponent(filter_special_price);}<?php } ?>
    <?php } else if ($val['filter']['type'] == 1) { ?>
        var filter_<?php echo $column; ?>=$('select[name=\'filter_<?php echo $column; ?>\']').val();
        <?php if (in_array($column, array('manufacturer', 'category', 'tax_class', 'store', 'filter', 'download'))) { ?>if(filter_<?php echo $column; ?>){<?php } else { ?>if(filter_<?php echo $column; ?>&&filter_<?php echo $column; ?>!='*'){<?php } ?>url+='&filter_<?php echo $column; ?>='+encodeURIComponent(filter_<?php echo $column; ?>)<?php echo ($column == "category") ? "+'&filter_sub_category=" . ((isset($filters['sub_category'])) ? $filters['sub_category'] : '0') . "'" : ""; ?>;}
            <?php } } } ?>location=url;}
    <?php foreach($column_info as $column => $val) { if ($val['filter']['autocomplete']) {?>
            $('input[name=\'filter_<?php echo $column; ?>\']').autocomplete({source:function(request,response){$.ajax({url:'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_<?php echo $column; ?>='+encodeURIComponent(request),dataType:'json',success:function(json){var dupes={},unique=[];$.each($.map(json,function(item){return {
    <?php foreach($val['filter']['autocomplete']['return'] as $k => $v) { ?><?php echo $k; ?>: item['<?php echo $v; ?>'],<?php } ?>}}),function(i,el){idx=el.value!==undefined?el.value:el;if(idx&&!dupes[idx]){dupes[idx]=true,unique.push(el)}}),response(unique)}});
            },select:function(item){$('input[name=\'filter_<?php echo $column; ?>\']').val(item['label']);return false;}});<?php } ?><?php } ?>
    $(function(){$("input.fltr.date_available,input.fltr.date_modified,input.fltr.date_added").datetimepicker({pickTime:!1,format:"YYYY-MM-DD",keepInvalid:1}),$(".qe<?php echo (!$aqe_multilingual_seo) ? ', .seo_qe' : ''; ?>").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>").done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{type:"bs_text",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",onblur:"cancel",placeholder:"",select:!0})<?php if ($aqe_multilingual_seo && !$single_lang_editing) { ?>,$(".seo_qe").editable(function(e,t){return t.indicator},{type:"multilingual_edit",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",onblur:"ignore",placeholder:"",loadurl:"<?php echo $load_popup_url; ?>",saveurl:"<?php echo $update_url; ?>",loadtype:"POST",loadtext:"<?php echo $text_loading; ?>"})<?php } ?>,$(".image_qe").editable(function(e,t){var i={alt:$(this.revert).attr("alt")};return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>",i).done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),$(this).html()},{type:"image_edit",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",onblur:"ignore",placeholder:""}),$(".cat_qe, .store_qe, .dl_qe, .filter_qe").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>",$("#aqeQuickEditForm").serializeHash()).done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{type:"multiselect_edit",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",onblur:"ignore",placeholder:"",loadurl:"<?php echo $load_popup_url; ?>",loadtype:"POST",loadtext:"<?php echo $text_loading; ?>"}),$(".attr_qe, .dscnt_qe, .images_qe, .filters_qe, .option_qe, .recur_qe, .related_qe, .dls_qe, .special_qe, .descr_qe").on("click",function(e){e.preventDefault();var t=$(this).attr("id"),i=$(this).attr("id").split("-")[1],l=$(this).attr("id").split("-")[0],p={alerts:$.merge($("#aqe-modal .notice"),$("#alerts"))};bull5i.load_popup_data("<?php echo $load_popup_url; ?>",{id:t}).done(function(e){e.alerts&&bull5i.display_alerts(e.alerts,!0,p.alerts),bull5i.aqe_popup(e.title,e.popup,function(o){e={id:t,old:"","new":""},bull5i.batch_edit&&$("input[name*='selected']:checked").length&&(e.ids=$("input[name*='selected']:checked").serializeObject().selected),$.extend(e,$("#aqeQuickEditForm").serializeHash()),bull5i.aqe_popup_update.call(p,"<?php echo $update_url; ?>",e).done(function(t){(t===!0||t.success)&&bull5i.update_related(l,$.unique($.merge([i],e.ids||[]))),$.isFunction(o)&&o.call(null,t)}).fail(function(e){$.isFunction(o)&&o.call(null,e)})},"modal-lg")})}),$(".date_qe").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>").done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{type:"date_edit",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",onblur:"ignore"}),$(".datetime_qe").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>").done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{type:"date_time_edit",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",onblur:"ignore"}),$(".status_qe").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>").done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{data:"<?php echo trim($status_select); ?>",type:"bs_select",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",onblur:"cancel"}),$(".qty_qe").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>").done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{data:function(e){return $.trim(e.replace(/<.*?>/g,""))},type:"bs_text",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",onblur:"cancel",placeholder:"",select:!0}),$(".price_qe").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>").done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{data:function(e){var t=$("<div/>").html(e);return t.children("span").length?t.children("span").first().text():$.trim(e)},type:"bs_text",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",onblur:"cancel",placeholder:"",select:!0})<?php if ($single_lang_editing) { ?>,$(".name_qe, .tag_qe<?php echo ($aqe_multilingual_seo) ? ', .seo_qe' : ''; ?>").editable(function(e,t){var i={lang_id:"<?php echo $language_id; ?>"};return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>",i).done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{type:"bs_text",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",onblur:"cancel",placeholder:"",select:!0})<?php } else { ?>,$(".name_qe, .tag_qe").editable(function(e,t){return t.indicator},{type:"multilingual_edit",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",onblur:"ignore",placeholder:"",loadurl:"<?php echo $load_popup_url; ?>",saveurl:"<?php echo $update_url; ?>",loadtype:"POST",loadtext:"<?php echo $text_loading; ?>"})<?php } ?>,$(".manufac_qe").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>").done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{data:"<?php echo trim($manufacturer_select); ?>",type:"bs_select",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",placeholder:"",onblur:"cancel"}),$(".length_qe").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>").done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{data:"<?php echo trim($length_class_select); ?>",type:"bs_select",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",placeholder:"",onblur:"cancel"}),$(".weight_qe").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>").done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{data:"<?php echo trim($weight_class_select); ?>",type:"bs_select",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",placeholder:"",onblur:"cancel"}),$(".yes_no_qe").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>").done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{data:"<?php echo trim($yes_no_select); ?>",type:"bs_select",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",placeholder:"",onblur:"cancel"}),$(".stock_qe").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>").done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{data:"<?php echo trim($stock_status_select); ?>",type:"bs_select",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",placeholder:"",onblur:"cancel"}),$(".tax_cls_qe").editable(function(e,t){return bull5i.quick_update(this,e,t,"<?php echo $update_url; ?>").done($.proxy(bull5i.update_finished,{column:$(this).attr("id").split("-")[0]})).fail($.proxy(bull5i.update_failed,this)),t.indicator},{data:"<?php echo trim($tax_class_select); ?>",type:"bs_select",indicator:"<?php echo $text_saving; ?>",tooltip:"<?php echo $aqe_tooltip; ?>",event:"<?php echo $aqe_quick_edit_on; ?>",placeholder:"",onblur:"cancel"})});
    }(window.bull5i=window.bull5i||{},jQuery));
    //--></script>

<?php echo $footer; ?>