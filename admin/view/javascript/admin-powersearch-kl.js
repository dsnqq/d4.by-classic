jQuery(document).ready(function($) {
	if (getURLVar('route') == 'catalog/product') {

		$("label[for='input-name']").after('<span class="powercomplete-list"><span data-toggle="tooltip-kl" title="autocomplete improved on/off">&#63; </span><input type="checkbox" name="switch" checked></span>');
		$("label[for='input-model']").after('<span class="powercomplete-list"><span data-toggle="tooltip-kl" title="autocomplete improved on/off">&#63; <input type="checkbox" name="switch" checked></span>');

		$('[name^="switch"]').bootstrapSwitch({
			'size': 'mini',
			'onColor': 'success'
		});
		$('.powercomplete-list').css({
			'float': 'right'
		});
		$('[data-toggle="tooltip-kl"]').tooltip();

	}

	// array of ids that have autocomplete functionality
	var AutocompleteIds = ['manufacturer', 'category', 'filter', 'download', 'related'];
	$(AutocompleteIds).each(function(i, e) {
		AutocompleteIds[i] = '#input-' + e;
	});

	if (getURLVar('route') == 'catalog/product/edit' || 'catalog/product/add') {

		//grab all elements with autocomplete tooltip
		var autocompTooltips = $(AutocompleteIds.join(', '));
		console.log(autocompTooltips);
		autocompTooltips.each(function() {
			$(this).parent().before('<span class="powercomplete-form"><input type="checkbox" name="switch" checked><span data-toggle="tooltip-kl" title="autocomplete improved on/off"> &#63;</span></span>');
		});

		$('[name^="switch"]').bootstrapSwitch({
			'size': 'mini',
			'onColor': 'success'
		});
		$('[data-toggle="tooltip-kl"]').tooltip();

		$('.powercomplete-form').css('margin', '15px');
	}
});