<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-manufacturer" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-manufacturer" class="form-horizontal">
          <ul class="nav nav-tabs" id="language">
            <?php foreach ($languages as $language) { ?>
            <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
          <?php foreach ($languages as $language) { ?>
            <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                <div class="col-sm-10">
                  <textarea name="manufacturer_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" data-lang="<?php echo $lang; ?>" class="form-control summernote"><?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['description'] : ''; ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-meta-h1<?php echo $language['language_id']; ?>"><?php echo $entry_meta_h1; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="manufacturer_description[<?php echo $language['language_id']; ?>][meta_h1]" value="<?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['meta_h1'] : ''; ?>" placeholder="<?php echo $entry_meta_h1; ?>" id="input-meta-h1<?php echo $language['language_id']; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                <div class="col-sm-10">
                  <textarea name="manufacturer_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                <div class="col-sm-10">
                  <textarea name="manufacturer_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($manufacturer_description[$language['language_id']]) ? $manufacturer_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                </div>
              </div>
            </div>
          <?php } ?>

          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">
                <div class="checkbox">
                  <label>
                    <?php if (in_array(0, $manufacturer_store)) { ?>
                    <input type="checkbox" name="manufacturer_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="manufacturer_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php foreach ($stores as $store) { ?>
                <div class="checkbox">
                  <label>
                    <?php if (in_array($store['store_id'], $manufacturer_store)) { ?>
                    <input type="checkbox" name="manufacturer_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="manufacturer_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
              <?php if ($error_keyword) { ?>
              <div class="text-danger"><?php echo $error_keyword; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
            <div class="col-sm-10"> <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
              <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>

          <div class="form-group">
              <label class="col-sm-2  control-label"><?php echo $tab_links;?></label>
			  <div class="col-sm-10">
              <div class="table-responsive">
                <table id="links" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-center"><?php echo $column_link_name; ?></td>
                      <td class="text-center"><?php echo $column_url; ?></td>
                      <td class="text-center" style="width:10%"><?php echo $column_sort_order; ?></td>
                      <td class="text-center" style="width:10%"><?php echo $column_target; ?></td>
                      <td class="text-center" style="width:10%"></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $links_row = 0; ?>
                    <?php foreach ($manufacturer_links as $manufacturer_link) { ?>
                    <tr id="links-row<?php echo $links_row; ?>">
					 
                      <td class="text-center">
					  <?php foreach($languages as $language) { ?>
					  <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" style="display:inline-block;"/> <input type="text" name="manufacturer_links[<?php echo $links_row; ?>][name][<?php echo $language['language_id']; ?>]" value="<?php if (isset($manufacturer_link['name'][$language['language_id']])) echo $manufacturer_link['name'][$language['language_id']]; ?>" class="form-control" style="display:inline-block;width:80%;" /><br>
					  <?php } ?>
					  </td>
                      <td class="text-center">
					  <?php foreach($languages as $language) { ?>
					  <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" style="display:inline-block;"/> <input type="text" name="manufacturer_links[<?php echo $links_row; ?>][link][<?php echo $language['language_id']; ?>]" value="<?php if (isset($manufacturer_link['link'][$language['language_id']])) echo $manufacturer_link['link'][$language['language_id']]; ?>" class="form-control" style="display:inline-block;width:80%;" /><br>
					  <?php } ?> 
					  </td>
                      <td class="text-center"><input type="text" name="manufacturer_links[<?php echo $links_row; ?>][sort_order]" value="<?php echo $manufacturer_link['sort_order']; ?>" class="form-control" /></td>
                      <td class="text-center">
					  <label class="radio-inline">
					 <?php if ($manufacturer_link['target']) { ?>
                    <input type="radio" name="manufacturer_links[<?php echo $links_row; ?>][target]" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="manufacturer_links[<?php echo $links_row; ?>][target]" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$manufacturer_link['target']) { ?>
                    <input type="radio" name="manufacturer_links[<?php echo $links_row; ?>][target]" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="manufacturer_links[<?php echo $links_row; ?>][target]" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
					  </td>
                      <td class="text-center"><button type="button" onclick="$('#links-row<?php echo $links_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                    </tr>
                    <?php $links_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="4"></td>
                      <td class="text-center"><button type="button" onclick="addLink();" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
			</div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
	var links_row = <?php echo isset($links_row) ? $links_row : 0; ?>;
  function addLink() {
	html  = '<tr id="links-row' + links_row + '">';
    html += '  <td class="text-center">';
	<?php foreach($languages as $language) { ?>
	html += ' <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" style="display:inline-block;"/> <input type="text" name="manufacturer_links[' + links_row + '][name][<?php echo $language['language_id']; ?>]" value="" class="form-control" style="display:inline-block;width:80%;" /><br>';
	<?php } ?>
	html += '</td>';
    html += '  <td class="text-center">';
	<?php foreach($languages as $language) { ?>
	html += ' <img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" style="display:inline-block;"/> <input type="text" name="manufacturer_links[' + links_row + '][link][<?php echo $language['language_id']; ?>]" value="" class="form-control" style="display:inline-block;width:80%;" /><br>';
	<?php } ?> 
	html += '</td>';
	html += '  <td class="text-center" style="width:10%"><input type="text" name="manufacturer_links[' + links_row + '][sort_order]" value=""  class="form-control" /></td>';
	html += '  <td class="text-center" style="width:10%"><label class="radio-inline"><input type="radio" name="manufacturer_links[' + links_row + '][target]" value="1" /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="manufacturer_links[' + links_row + '][target]" value="0" checked="checked" /><?php echo $text_no; ?></label></td>';
	html += '  <td class="text-center"><button type="button" onclick="$(\'#links-row' + links_row + '\').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';

	$('#links tbody').append(html);

	links_row++;
}
//--></script>
  <script type="text/javascript"><!--
    <?php if ($ckeditor) { ?>
    <?php foreach ($languages as $language) { ?>
      ckeditorInit('input-description<?php echo $language['language_id']; ?>', getURLVar('token'));
      <?php } ?>
    <?php } ?>
  //--></script>
  <script type="text/javascript"><!--
    $('#language a:first').tab('show');
    //--></script></div>
</div>
<?php echo $footer; ?>
