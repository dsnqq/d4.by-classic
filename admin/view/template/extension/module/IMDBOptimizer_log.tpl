<?php
	/*
		Author: Igor Mirochnik
		Site: http://ida-freewares.ru
		Site: http://im-cloud.ru
		Email: dev.imirochnik@gmail.com
		Type: commercial
	*/

	// Формирование html select
	if (!function_exists('echoHtmlSelect'))
	{
		function echoHtmlSelect($name, $data, $curr_val = '', $append_class = '',
							$is_multi = false, $val_name = 'id', $text_name = 'name')
		{
			$result = '<select name="' . $name . '" '
						. ' class="form-control ' . $append_class . '" '
						. ($is_multi ? ' multiple="multiple" ' : '')
				. ' >';

			foreach($data as $key => $item)
			{
				$result .= '<option value="' . $item[$val_name] . '" '
							. (('' . $item[$val_name] == $curr_val )? ' selected="selected" ' : '')	. '>'
						. $item[$text_name]
					. '</option>';
			}

			return $result . '</select>';
		}
	}

	if (!function_exists('echoLabel'))
	{
		function echoLabel($module_label, $name)
		{
			if (isset($module_label)) {
				if (is_array($module_label)) {
					if (isset($module_label[$name]))
						return $module_label[$name];
				}
			}
			return $name;
		}
	}

	if (!function_exists('echoDate'))
	{
		function echoDate($name, $module_label, $label = '', $value = '', $append_class = '')
		{
			return
				'<div class="form-group">'
				    . '<label class="control-label" for="">'
				    	. echoLabel($module_label, $label)
				    . '</label>'
				    . '<div class="input-group date">'
				      	.' <input type="text" '
				      		. ' name="' . $name . '" '
				      		. ' value="' . $value . '" '
				      		. ' placeholder="' . echoLabel($module_label, $label) . '"'
				      		. ' data-date-format="DD.MM.YYYY"'
				      		. ' class="form-control ' . $append_class . '"/>'
				      	. '<span class="input-group-btn">'
				      	. '<button type="button" class="btn btn-default">'
				      		. '<i class="fa fa-calendar"></i>'
				      	. '</button>'
				      	.'</span>'
				    . '</div>'
			  	. '</div>'
		  	;
		}
	}

	if (!function_exists('echoTextAreaControl'))
	{
		function echoTextAreaControl($name, $module_label, $label = '', $value = '', $append_class = '')
		{
			return
				'<div class="form-group ">'
	    			. '<label class=" control-label" for="">'
	    				. echoLabel($module_label, $label)
	    			. '</label>'
	    			. '<div class="">'
	      				. '<textarea '
	      					. ' name="' . $name . '" '
	      					. ' placeholder="' . echoLabel($module_label, $label) . '" '
	      					. ' class="form-control ' . $append_class . '">'
	      						. $value
	      				. '</textarea>'
					. '</div>'
		  		. '</div>'
			;
		}
	}

	if (!function_exists('echoInputControl'))
	{
		function echoInputControl($name, $module_label, $label = '', $value = '', $append_class = '')
		{
			return
				'<div class="form-group ">'
	    			. '<label class=" control-label" for="">'
	    				. echoLabel($module_label, $label)
	    			. '</label>'
	    			. '<div class="">'
	      				. '<input '

	      					. ' type="textbox"'
	      					. ' name="' . $name . '" '
	      					. ' value="' . $value . '" '
	      					. ' placeholder="' . echoLabel($module_label, $label) . '" '
	      					. ' class="form-control ' . $append_class . '"/>'
					. '</div>'
		  		. '</div>'
			;
		}
	}

	if (!function_exists('echoSelectControl'))
	{
		function echoSelectControl($data, $name, $module_label, $label = '', $value = '', $append_class = '',
									$is_multi = false, $val_name = 'id', $text_name = 'name')
		{
			return
				'<div class="form-group ">'
	    			. '<label class=" control-label" for="">'
	    				. echoLabel($module_label, $label)
	    			. '</label>'
	    			. '<div class="">'
	      				. echoHtmlSelect($name, $data, $value, $append_class, $is_multi, $val_name, $text_name)
					. '</div>'
		  		. '</div>'
			;
		}
	}

?>

<!-- ------------ -->
<!-- DBOpt Service -->
<!-- ------------ -->
<div class="tab-pane" id="imdbopt-log">

	<form class="form IMDBOptimizer-form"
		action="<?php echo $replace; ?>" method="post"
		enctype="multipart/form-data"
		id="form_imdbo_log"
	>

		<div class="well">
			<div class="row">
				<div class="col-sm-6">
					<?php
						echo
						//$data, $name, $module_label, $label = '', $value = '', $append_class = '',
						//			$is_multi = false, $val_name = 'id', $text_name = 'name'
						echoSelectControl(
							$list_on_off,
							'IMDBOptimizer[log][enable_log_slow_query]',
							$module_label,
							'label_field_enable_log_slow_query',
							isset($data_log['enable_log_slow_query']) ? $data_log['enable_log_slow_query'] : 0,
							''
						);
					?>
				</div>
				<div class="col-sm-6">
					<?php
						echo
						echoSelectControl(
							$list_on_off,
							'IMDBOptimizer[log][enable_log_slow_query_admin]',
							$module_label,
							'label_field_enable_log_slow_query_admin',
							isset($data_log['enable_log_slow_query_admin']) ? $data_log['enable_log_slow_query_admin'] : 0,
							''
						);
					?>
				</div>
				<div class="col-sm-6">
					<?php
						echo
						//$name, $module_label, $label = '', $value = '', $append_class = '')
						echoInputControl(
							'IMDBOptimizer[log][log_slow_query_time]',
							$module_label,
							'label_field_log_slow_query_time',
							isset($data_log['log_slow_query_time']) ? $data_log['log_slow_query_time'] : 1000,
							''
						);
					?>
				</div>
				<div class="col-sm-6">
					<?php
						echo
						echoSelectControl(
							$list_on_off,
							'IMDBOptimizer[log][log_slow_query_write_url]',
							$module_label,
							'label_field_log_slow_query_write_url',
							isset($data_log['log_slow_query_write_url']) ? $data_log['log_slow_query_write_url'] : 0,
							''
						);
					?>
				</div>

				<div class="col-sm-12">
					<hr/>
				</div>

				<!-------------------------->
				<!-- Buttons -->
				<!-------------------------->

				<div class="col-sm-12">
					<div class="form-group">
						<div class="buttons">
							<a class="button btn-im-download btn btn-info pull-right"
								style="color:white">
								<i class="fa fa-download"></i> &nbsp;
								<?php echo
									echoLabel($module_btn_label, 'button_download_log_file'); ?>
								(<?php echo $data_log_file_statistic['size_normal'] ?>)
							</a>

							<a class="button btn-im-save btn btn-success"
								style="color:white">
								<i class="fa fa-save"></i> &nbsp;
								<?php echo
									echoLabel($module_btn_label, 'button_save_log_settings'); ?>
							</a>
							&nbsp;&nbsp;&nbsp;
							<a class="button btn-im-clear-log btn btn-danger"
								style="color:white">
								<i class="fa fa-remove"></i> &nbsp;
								<?php echo
									echoLabel($module_btn_label, 'button_clear_log'); ?>
							</a>
							&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;
							<span class="generate-status"></span>
						</div>
					</div>
				</div>

				<div class="col-sm-12">
					<hr/>
				</div>

			</div>
		</div>

	</form>
</div>

<script type="text/javascript">

	function IMDBO_saveLogSettings(form, onLoad)
	{
		// Форма еще не выстроена
		if (form.serializeArray().length == 0)
			return;

		IMDBO_ajaxOperation({
			form: form,
			data: form.serializeArray(),
			url: module_links.saveLogSettings,
			status: {
				selector: '.generate-status',
				text: {
					action: module_texts.save,
					success: module_texts.saveSetOk,
					fail: module_texts.saveSetFail
				}
			},
			onLoad: function (json) {
				if (typeof(onLoad) === 'function') {
					onLoad(form, json);
				}
			}
		});
	}

	function IMDBO_clearLog(form, onLoad)
	{
		// Форма еще не выстроена
		if (form.serializeArray().length == 0)
			return;

		IMDBO_ajaxOperation({
			form: form,
			data: form.serializeArray(),
			url: module_links.clearLog,
			status: {
				selector: '.generate-status',
				text: {
					action: module_texts.removeLog,
					success: module_texts.removeLogOk,
					fail: module_texts.removeLogFail
				}
			},
			onLoad: function (json) {
				if (typeof(onLoad) === 'function') {
					onLoad(form, json);
				}
			}
		});
	}

	function IMDBO_downloadLog(form, onLoad)
	{
		var jq = jQuery,
			bodyIMDBOlog = jq('#imdbopt-log')
		;

		jq('#imdbopt-log #log-iframe').remove();

		bodyIMDBOlog.append(
			'<div id="log-iframe" style="height:1px;">'
				+ '<iframe src="' + module_links.downloadLog + '" width="1px" height="1px" '
					+ 'style="border:0px;" />'
			+ '</div>'
		);

		if (typeof(onLoad) === 'function') {
			onLoad(form);
		}
	}

	//////////////////////////////////////////////
	// Загрузка DOM
	//////////////////////////////////////////////
	jQuery(function () {
		jQuery('#imdbopt-log .btn-im-save').click(function () {
			IMDBO_saveLogSettings(jQuery(this).closest('form'));
		});

		jQuery('#imdbopt-log .btn-im-clear-log').click(function () {
			IMDBO_clearLog(jQuery(this).closest('form'));
		});

		jQuery('#imdbopt-log .btn-im-download').click(function () {
			IMDBO_downloadLog(jQuery(this).closest('form'));
		});
	});
</script>


<style type="text/css">
	.IMDBOptimizer .form-group
	{
	    padding-top: 15px;
	    padding-bottom: 15px;
	    margin-bottom: 0;
	}

	.IMDBOptimizer .form-group span.blue
	{
		color: #000042;
    	font-size: 15px;
	}

	.IMDBOptimizer .clear
	{
		clear: both;
	}

	.IMDBOptimizer .well .row .form-group
	{
	    padding-top: 5px;
	    padding-bottom: 8px;
	    margin-bottom: 0;
	}

	.IMDBOptimizer .hidden
	{
		display: none;
	}

	select.im-product-list-select
	{
	    height: 305px;
	}

	.IMDBOptimizer .iml-cursor
	{
		cursor: pointer;
	}

	.IMDBOptimizer .save-status.success,
	.IMDBOptimizer .generate-status.success,
	.IMDBOptimizer .generate-schema-status.success,
	.IMDBOptimizer .get-product-status.success,
	.IMDBOptimizer .get-delete-settings-status.success
	{
    	color: green;
	}

	.IMDBOptimizer .save-status.fail,
	.IMDBOptimizer .generate-status.fail,
	.IMDBOptimizer .generate-schema-status.fail,
	.IMDBOptimizer .get-product-status.fail,
	.IMDBOptimizer .get-delete-settings-status.fail
	{
    	color: red;
	}

	.IMDBOptimizer .textcontrol-min-height
	{
		min-height: 100px;
	}

</style>
