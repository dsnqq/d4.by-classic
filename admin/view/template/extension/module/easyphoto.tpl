<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-google-hangouts" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-google-hangouts" class="form-horizontal">
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-easyphoto_direct"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo $easyphoto_direct_help; ?>"><?php echo $entry_direct; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="easyphoto_direct" value="<?php echo $easyphoto_direct; ?>" placeholder="easyphoto" id="input-easyphoto_direct" class="form-control" />
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-easyphoto_prefix"><?php echo $entry_prefix; ?></label>
            <div class="col-sm-10">
              <input type="text" name="easyphoto_prefix" value="<?php echo $easyphoto_prefix; ?>" placeholder="dmYh" id="input-easyphoto_prefix" class="form-control" />
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-easyphoto_separator"><?php echo $entry_separator; ?></label>
            <div class="col-sm-10">
              <input type="text" name="easyphoto_separator" value="<?php echo $easyphoto_separator; ?>" placeholder="1000" id="input-easyphoto_separator" class="form-control" />
            </div>
          </div>
		  <div class="form-group">
            <label class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
              <?php echo $text_manual; ?>
		    </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>