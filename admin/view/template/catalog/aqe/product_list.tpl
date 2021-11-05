<?php echo $header; ?>
<?php require_once $_SERVER['DOCUMENT_ROOT'].'/admin/product_config.php';?>

<!-- confirm deletion -->
<div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="confirmDeleteLabel"><?php echo $text_confirm_delete; ?></h4>
			</div>
			<div class="modal-body">
				<p><?php echo $text_are_you_sure; ?></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-ban"></i> <?php echo $button_cancel; ?></button>
				<button type="button" class="btn btn-danger delete"><i class="fa fa-trash-o"></i> <?php echo $button_delete; ?></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<?php if (in_array("image", $columns) || in_array("images", $actions)) { ?>
<!-- image manager -->
<div class="modal fade" id="modal-image" tabindex="-1" role="dialog" aria-hidden="true"></div>
<?php } ?>

<!-- action menu modal -->
<div class="modal fade" id="aqe-modal" tabindex="-1" role="dialog" aria-labelledby="aqeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="aqeModalLabel"></h4>
			</div>
			<div class="modal-body bull5i-container">
				<div class="notice">
				</div>
				<form enctype="multipart/form-data" id="aqeQuickEditForm" class="form-horizontal">
					<fieldset class="aqe-modal-contents">
					</fieldset>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default cancel" data-dismiss="modal"><i class="fa fa-times"></i> <?php echo $button_close; ?></button>
				<button type="button" class="btn btn-primary submit" data-form="#aqeQuickEditForm" data-context="#aqe-modal" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <?php echo $text_saving; ?>"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<?php echo $column_left; ?>
<div id="content">
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
							<h1 class="bull5i-navbar-brand"><i class="fa fa-cubes fa-fw ext-icon"></i> <?php echo $heading_title; ?></h1> <span style="font-size: 18px;font-weight: bold;line-height: 39px;"><?php echo $all_product_count; ?> штук</span>
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
									<button type="button" class="btn btn-primary" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_add; ?>" data-url="<?php echo $add; ?>" id="btn-insert" data-form="#pqe-list-form" data-context="#content"><i class="fa fa-plus"></i> <span class="visible-lg-inline visible-xs-inline">Добавить запчасть</span></button>
									<!---<button type="button" class="btn btn-default" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_copy; ?>" data-url="<?php echo $copy; ?>" id="btn-copy" data-form="#pqe-list-form" data-context="#content" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <?php echo $text_copying; ?>" disabled><i class="fa fa-files-o"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_copy; ?></span></button>--->
									<button type="button" class="btn btn-danger" data-toggle="tooltip" data-container="body" data-placement="bottom" title="<?php echo $button_delete; ?>" data-url="<?php echo $delete; ?>" id="btn-delete" data-form="#pqe-list-form" data-context="#content" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <?php echo $text_deleting; ?>" disabled><i class="fa fa-trash-o"></i> <span class="visible-lg-inline visible-xs-inline"><?php echo $button_delete; ?></span></button>
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

										<?php if (!empty($column_info[$col]['sort'])) { ?>
									<th class="<?php echo $column_info[$col]['align']; ?> col_<?php echo $col; ?>"><a href="<?php echo $sorts[$col]; ?>"<?php echo ($sort == $column_info[$col]['sort']) ? ' class="' . strtolower($order) . '"' : ''; ?>><?php echo $column_info[$col]['name']; ?></a></th>
										<?php } else { ?>
									<th class="<?php echo $column_info[$col]['align']; ?> col_<?php echo $col; ?>"><?php echo $column_info[$col]['name']; ?></th>
										<?php } ?>
										<?php /*<th class="text-right col_description">Объем</th>
										<th class="text-right col_description">Тип топлива</th> */ ?>
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
									//btn-group btn-group-flex
									case 'action': ?>
								<th class="<?php echo $column_info[$col]['align']; ?>">
									<div class="">
										<button type="button" class="btn btn-sm btn-default" id="filter" data-toggle="tooltip" data-container="body" style="font-weight: bold;background: #67d55c;font-size: 20px;" title="<?php echo $text_filter; ?>">Поиск</button>
										<br><button type="button" class="btn btn-sm btn-default" id="clear-filter" data-toggle="tooltip" style="font-weight: bold;background: #FFEB3B;font-size: 20px;" data-container="body" title="<?php echo $text_clear_filter; ?>">Сброс</button>
									</div>
								</th>
									<?php break;
									case 'manufacturer': ?>
								<th class="<?php echo $column_info[$col]['align']; ?>" style="position:relative;">
									<span class="select2-selection__clear"><span>Очистить </span>×</span>
									<select name="filter_<?php echo $col; ?>" class="same_pick form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>" data-live-search="true">
										<?php /*<option value=""></option>*/ ?>
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
										<?php /*<option value=""></option>*/ ?>
										<option value=""<?php echo (!is_null($filters[$col]) && $filters[$col] == '*') ? ' selected' : ''; ?>><?php echo $text_none; ?></option>
										<?php foreach ($categories as $c) { ?>
										<option value="<?php echo $c['category_id']; ?>"<?php echo (!is_null($filters[$col]) && $c['category_id'] == $filters[$col]) ? ' selected' : ''; ?>><?php echo $c['name']; ?></option>
										<?php } ?>
									</select>
								</th>
								<?php /*<th></th>
								<th></th> */ ?>
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
									<!---
								<th class="<?php echo $column_info[$col]['align']; ?>">
									<div class="input-group">
										<input type="text" name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" id="filter_price" value="<?php echo (in_array($filters['special_price'], array('active', 'expired', 'future'))) ? $filters['special_price'] : (!is_null($filters[$col]) ? $filters[$col] : ''); ?>" data-column="<?php echo $col; ?>" <?php echo (in_array($filters['special_price'], array('active', 'expired', 'future'))) ? ' disabled' : ''; ?>>
										<input type="hidden" name="filter_special_price" value="" id="filter_special_price">
										<div class="input-group-btn" data-toggle="buttons">
											<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" tabindex="-1">
												<span class="caret"></span>
												<span class="sr-only"><?php echo $text_toggle_dropdown; ?></span>
											</button>
											<ul class="dropdown-menu text-left pull-right price" role="menu">
												<li<?php echo (!in_array($filters['special_price'], array('active', 'expired', 'future'))) ? ' class="active"' : ''; ?>><a href="#" class="filter-special-price" data-value="" id="special-price-off"><i class="fa fa-fw<?php echo (!in_array($filters['special_price'], array('active', 'expired', 'future'))) ? ' fa-check' : ''; ?>"></i> <?php echo $text_special_off; ?></a></li>
												<li<?php echo ($filters['special_price'] == 'active') ? ' class="active"' : ''; ?>><a href="#" class="filter-special-price" data-value="active"><i class="fa fa-fw<?php echo ($filters['special_price'] == 'active') ? ' fa-check' : ''; ?>"></i> <?php echo $text_special_active; ?></a></li>
												<li<?php echo ($filters['special_price'] == 'expired') ? ' class="active"' : ''; ?>><a href="#" class="filter-special-price" data-value="expired"><i class="fa fa-fw<?php echo ($filters['special_price'] == 'expired') ? ' fa-check' : ''; ?>"></i> <?php echo $text_special_expired; ?></a></li>
												<li<?php echo ($filters['special_price'] == 'future') ? ' class="active"' : ''; ?>><a href="#" class="filter-special-price" data-value="future"><i class="fa fa-fw<?php echo ($filters['special_price'] == 'future') ? ' fa-check' : ''; ?>"></i> <?php echo $text_special_future; ?></a></li>
											</ul>
										</div>
									</div>
								</th> -->
									<?php break; 
									
									case 'length':
									?>
									<?php /*<th class="<?php echo $column_info[$col]['align']; ?>"><input style="width:60px	;" type="text" name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?>" data-column="<?php echo $col; ?>" value="<?php echo !is_null($filters[$col]) ? $filters[$col] : ''; ?>"></th> */ ?>
									<th style="position:relative;" id="">

										<?php 
											$filter_length_ex = explode("<=", $_GET['filter_length']);
										?>

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
											<div id="filter_yeaerChangeTh1" style="">
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
										<script>
											$('body').on('change', '#filter_yeaerChange', function(){
												let first_year = "";
												let last_year = "";
												$('#filter_yeaerChangeTh').find('ul.dropdown-menu.inner').find('li').each(function() { 
													if($(this).hasClass('selected')){
														if($(this).text() != "Год"){
															first_year = $(this).text();
														}else{
															first_year = "";
														}
													}
												});
												$('#filter_yeaerChangeTh1').find('ul.dropdown-menu.inner').find('li').each(function() { 
													if($(this).hasClass('selected')){
														if($(this).text() != "Год"){
															last_year = $(this).text();
														}else{
															last_year = "";
														}
													}
												});
												//alert(first_year);
												if(first_year != "" && last_year != ""){
													$('#filter_yeaerChangeData').val(first_year + "<=" + last_year);
													$('#filter_yeaerChangeData').attr("value", first_year + "<=" + last_year);
												} else if(first_year != "" && last_year == ""){
													$('#filter_yeaerChangeData').val(first_year + "<=");
													$('#filter_yeaerChangeData').attr("value", first_year + "<=");
												}else{ 
													$('#filter_yeaerChangeData').val("");
													$('#filter_yeaerChangeData').attr("value", "");
												}
											});

											$('body').on('change', '#filter_yeaerChange1', function(){
												let first_year = "";
												let last_year = "";
												$('#filter_yeaerChangeTh').find('ul.dropdown-menu.inner').find('li').each(function() { 
													if($(this).hasClass('selected')){
														if($(this).text() != "Год"){
															first_year = $(this).text();
														}else{
															first_year = "";
														}
													}
												});
												$('#filter_yeaerChangeTh1').find('ul.dropdown-menu.inner').find('li').each(function() { 
													if($(this).hasClass('selected')){
														if($(this).text() != "Год"){
															last_year = $(this).text();
														}else{
															last_year = "";
														}
													}
												});
												if(first_year != "" && last_year != ""){
													$('#filter_yeaerChangeData').val(first_year + "<=" + last_year);
													$('#filter_yeaerChangeData').attr("value", first_year + "<=" + last_year);
												} else if(first_year == "" && last_year != ""){
													$('#filter_yeaerChangeData').val("<=" + last_year);
													$('#filter_yeaerChangeData').attr("value", "<=" + last_year);
												} else{ 
													$('#filter_yeaerChangeData').val("");
													$('#filter_yeaerChangeData').attr("value", "");
												}
											});
										</script>
										<style>
											#filter_yeaerChangeTh .btn-group.bootstrap-select.form-control{position: relative;top: 8px;background: none;}
											#filter_yeaerChangeTh1 .btn-group.bootstrap-select.form-control{position: relative;top: 8px;background: none;}
											#filter_yeaerChangeTh button,#filter_yeaerChangeTh1 button{width:60px;}
										</style>
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
									<!---<th style="position:relative;" class="<?php echo $column_info[$col]['align']; ?>"><span class="select2-selection__clear"><span>Очистить </span>×</span><input type="text" name="filter_<?php echo $col; ?>" class="form-control input-sm search_init fltr <?php echo $col; ?> typeahead" placeholder="<?php echo $text_autocomplete; ?>" value="<?php echo !is_null($filters[$col]) ? $filters[$col] : ''; ?>" data-column="<?php echo $col; ?>"></th>--->
									<th class="<?php echo $column_info[$col]['align']; ?>">
									<select name="filter_<?php echo $col; ?>" class=" form-control input-sm isbn_toplivo fltr <?php echo $col; ?> typeahead" data-column="<?php echo $col; ?>">
											<option value=""<?php echo (is_null($filters[$col])) ? ' selected' : ''; ?>>--- Не выбрано ---</option>
											<option value="дизель"<?php echo (!is_null($filters[$col]) && 'дизель' == $filters[$col]) ? ' selected' : ''; ?>>дизель</option>
											<option value="бензин"<?php echo (!is_null($filters[$col]) && 'бензин' == $filters[$col]) ? ' selected' : ''; ?>>бензин</option>
											<option value="гибрид"<?php echo (!is_null($filters[$col]) && 'гибрид' == $filters[$col]) ? ' selected' : ''; ?>>гибрид</option>
											<option value="электро"<?php echo (!is_null($filters[$col]) && 'электро' == $filters[$col]) ? ' selected' : ''; ?>>электро</option>
										</select>
										<input type="text" id="isbn_toplivo" name="filter_<?php echo $col; ?>" style="opacity:0;position:absolute;left:-999999px;" value="">
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
										<a data-lightbox="image<?php echo $product['product_id']; ?>" href="/image/<?php echo $product['thumb']; ?>">
											<img src="<?php echo $product['thumb_mini']; ?>" width="150px" alt="<?php echo $product['name']; ?>" class="img-thumbnail" data-id="<?php echo $product['product_id']; ?>" data-image="<?php echo $product['image']; ?>" />
										</a>
									</div>
									<?php foreach($product['images'] as $images__itm){ ?>
										<?php if($images__itm['image'] != $product['thumb']){ ?>
											<a data-lightbox="image<?php echo $product['product_id']; ?>" href="/image/<?php echo $images__itm['image']; ?>">
												<img src="/image/<?php echo $images__itm['image']; ?>" width="50px" alt="<?php echo $product['name']; ?>" class="img-thumbnail" data-id="<?php echo $product['product_id']; ?>" data-image="<?php echo $product['image']; ?>" />
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
									<div class="btn-group btn-group-flex">
									<a style="display: flex;align-items: center;" class="btn-default btn-xs btn-danger deletedButton" href="https://d4.by/admin/index.php?route=catalog/product/deleted&amp;product_id=<?php echo $product['product_id']; ?>&amp;token=<?php echo $token; ?><?php echo $product['url_deleted']; ?>"><i class="fa fa-trash-o"></i></a>
									<a style="display: flex;align-items: center;border: 1px solid #ccc;" class="btn-default btn-xs addPhotoButton"><i class="fa fa-camera"></i></a>
									<?php foreach ($product['action'] as $action) { ?>
									<?php if ($action['url']) { ?>
										<a href="<?php echo $action['url']; ?>" <?php echo ($action['type'] == 'view') ? "target='_blank'" : ""; ?> class="btn btn-default btn-xs <?php echo $action['type']; ?> <?php echo $action['class']; ?>" id="<?php echo $action['action'] . "-" . $product['product_id']; ?>" data-toggle="tooltip" data-container="body" title="<?php echo $action['title']; ?>"><i class="fa fa-<?php echo $action['icon']; ?>"></i><?php echo $action['name']; ?></a>
									<?php } else { ?>
										<button type="button" class="btn btn-default btn-xs action <?php echo $action['type']; ?> <?php echo $action['class']; ?>" id="<?php echo $action['action'] . "-" . $product['product_id']; ?>" data-toggle="tooltip" data-container="body" title="<?php echo $action['title']; ?>" data-column="<?php echo $action['action']; ?>"<?php echo ($action['rel']) ? ' data-rel="' . $action['rel'] . '"' : ''; ?>><?php if ($action['icon']) { ?><i class="fa fa-<?php echo $action['icon']; ?>"></i><?php } ?><?php echo $action['name']; ?></button>
									<?php } ?>
									<?php } ?>
									</div><br>
									<div style="margin-top:10px;text-align:center;">Количество просмотров: <?php echo $product['viewers']; ?></div>
									<?php 
										$product['cat_qr'] = str_replace('&nbsp;&nbsp;&gt;&nbsp;&nbsp;', ' ', $product['cat_qr']);
										$qr_title = "<div>".$product['cat_qr'] . ", " . $product['length'] . "г. " . $product['ean'] . "</div><div>" . $product['jan'] . " " .$product['isbn'] . " " . $product['mpn'] . " " . $product['upc'] . "</div><div>" . $product['manufers'] . "</div><div>" . '<span style="font-size:17px;">' .$product['modelQR'] . '</span></div>';
									?>
									<div style="color: #23b423;border-color: #23b423;" id="" class="btn btn-default printQrOuterLists" data-qrmodel="<?php echo $product['modelQR']; ?>" data-qrid="<?php echo $product['product_id']; ?>" data-titles='<?php echo $qr_title; ?>'>Печать QR код</div>
									<?php
										require_once $_SERVER['DOCUMENT_ROOT'].'/gd/phpqrcode/qrlib.php';
									
										/* Генерация QR-кода во временный файл */
										QRcode::png('https://d4.by/gd/?product_id='.$product['product_id'], '/home/dby/sites/d4.by/gd/qr/'.$product['modelQR'].'_tmp.png', 'Q', 6, 1);
										
										/* Конвертация PNG8 в PNG24 */
										$im = imagecreatefrompng($_SERVER['DOCUMENT_ROOT'].'/gd/qr/'.$product['modelQR'].'_tmp.png');
										
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
										imagepng($dst,$_SERVER['DOCUMENT_ROOT'].'/gd/qr/'.$product['modelQR'].'_main.png',3);
										
										unlink($_SERVER['DOCUMENT_ROOT'].'/gd/qr/'.$product['modelQR'].'_tmp.png');

										//$img_sm_qr1 = '<img src="https://d4.by/gd/qr/'.$product['modelQR'].'_main.png" style="width:110px;">';
										//echo '<br><br>';
										
										
										
										//echo '<div style="display:flex;align-items:center;max-width:275px;border:1px solid #000;"><div>'.$img_sm_qr1.'</div><div style="text-align:center;font-size:12px;padding-left:10px;margin:0 auto;font-weight:bold;line-height:18px;">'.$qr_title.'</div></div>';
								?>
								</td>
									<?php break; ?>	
									<?php case 'status': ?>
									<td <?php echo ($product[$col] == Активно) ? 'style="background:#23b423;color:#000;font-weight:bold;"' : 'style="color:#000;background:red;font-weight:bold;"'; ?> data-id="<?=$product['product_id']?>" class="status_favourite <?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>"><?php echo $product[$col]; ?></td>
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
										<?php // R15; 6.0j; 4-114.3; ET-46; DIA - 56.1 ?>
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
										<?php /*<td style="max-width:150px;"><?php echo $product['jan']; ?></td>
										<td style="max-width:150px;"><?php echo $product['isbn']; ?> <?php echo $product['mpn']; ?></td> */ ?>
										<?php break; ?>	
										<?php case 'price': ?>
											<td data-text="<?php echo $product['price_BYN'];?>&#10;<?php echo $product['price_RUB'];?>" class="price_BYN<?php echo $product['product_id']; ?> <?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>"><?php echo $product[$col]; ?>
											
											
											</td>
								<style>
									.price_BYN<?php echo $product['product_id']; ?>:after{content: attr(data-text);
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
											<td class="<?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>"><?php echo $product[$col]; ?><?php if($product['date_mod'] != "0000-00-00 00:00:00"){ ?><br><span style="font-size:10px;">Последнее изменение:</span><br><?php echo $product['date_mod']; ?><?php } ?></td>
										<?php break; ?>


										<?php case 'sku': ?>
				<td class="<?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?> sku_qe_br" id="<?php echo $col . "-" . $product['product_id']; ?>"><?php echo $product[$col]; ?></td>
										<?php break; ?>
													<?php 
											default: ?>
								<td class="<?php echo $column_info[$col]['align']; ?><?php echo ($column_info[$col]['qe_status']) ? ' ' . $column_info[$col]['type'] : ''; ?>" id="<?php echo $col . "-" . $product['product_id']; ?>"><?php echo $product[$col]; ?></td>
													<?php break;
									}
								} ?>
							</tr>
							<?php } ?>
							<?php } else { ?>
							<tr>
								<td class="text-center" colspan="<?php echo count($columns) + 1; ?>"><?php echo $text_no_results; ?></td>
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
<?php /* javascript for bootstrap select */ ?>
<style>
	.text-left.col_category{
		min-width:170px;
	}
	.text-left.col_manufacturer{
		min-width:170px;
	}
	.bootstrap-select .dropdown-menu{
		right:-80px !important;
	}
	body{
		color:#000;
	}
	#batch-edit-container{
		display:none !important;
	}
</style>
<link type="text/css" href="view/stylesheet/bootstrap-select.css" rel="stylesheet" media="screen" />
<script src="view/javascript/bootstrap-select.min.js"></script>
<script src="view/javascript/jquery.chained.js"></script>

<link rel="stylesheet" href="/admin/view/stylesheet/dropzone.css" />
<script src="/admin/view/javascript/dropzone.js"></script>

<script>

$(document).ready(function() {
	
	$(".deletedButton").on("click", function () {
		return confirm("Вы действительно хотите удалить З/Ч ?");
	});
	$('.isbn_toplivo').on('change', function(){
		$('#isbn_toplivo').val($(this).val());
	});

});
/*
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
				var submitButton = document.querySelectorAll('.addPhotoButton');
				myDropzone = this;
				submitButton.addEventListener("click", function() {
					myDropzone.processQueue();
				});
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

});*/
// end add photo



      $(document).ready(function() {
		/*$("body").on("keydown", function (e) {
			if(13 == e.keyCode){
				$('#filter').trigger('click');
			}
		})*/
		$('body').on('click','.printQrOuterLists', function(){
				var idThis = $(this).data('qrid');//здесь получаем ID 	
				var modelThis = $(this).data('qrmodel');//здесь получаем Model
				var titlesThis = $(this).data('titles'); // получаем title
				var this_elem = $(this);
						
				var frame = window.frames['imgFrame'];
				frame.document.write('<html><head><style>@print{@page :footer {color: #fff }@page :header {color: #fff}}</style></head><body style="font-family: Open Sans, sans-serif;" onload="window.print()"><div style="margin:0 auto;color:#000;display:flex;align-items:center;max-width:275px;border:1px solid #000;"><div><img src="https://d4.by/gd/qr/'+modelThis+'_main.png" style="width:110px;"></div><div style="text-align:center;font-size:12px;margin:0 auto;padding-left:10px;font-weight:bold;line-height:18px;">'+titlesThis+'</div></div></body></html>');
				frame.document.close();
		});

		$('body').on('click','.status_favourite', function(){
				// здесь отслеживаем выбор ID
				var selectedItem = $(this).data('id');//здесь получаем ID 	
				var this_elem = $(this);
							
				$.ajax({
					url: 'index.php?route=catalog/product/actions&token=<?php echo $token; ?>&actions='+selectedItem,
					dataType: 'html',
					data: {
					"actions" : selectedItem
					},
					cache: false,
					method: 'POST',
					success: function(html) {
						var actions = html; 
						if(actions == '1'){
							this_elem.text('Активно');
							this_elem.attr('style','color:#000;background:#23b423;font-weight:bold;');
						}else{
							this_elem.text('Неактивно');
							this_elem.attr('style','color:#000;background:red;font-weight:bold;');
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
