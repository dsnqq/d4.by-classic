<?php echo $header; ?>
<?php if((float)VERSION < 2) { ?>
<script   src="https://code.jquery.com/jquery-1.9.1.min.js"   integrity="sha256-wS9gmOZBqsqWxgIVgA8Y9WcQOa7PgSIX+rPA0VL2rbQ="   crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<?php } else { echo $column_left; } ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-speciallist" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-speciallist" class="form-horizontal">
		
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="fx_text_defalt"><?php echo $text_defalt; ?></label>
                    <div class="col-sm-10">
                      <textarea name="fx_sitemap_default" id="fx_sitemap_default" class="form-control"><?php echo $fx_sitemap_default; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="fx_text_key"><?php echo $text_key; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="fx_sitemap_key" value="<?php echo $fx_sitemap_key; ?>" id="fx_sitemap_key" class="form-control" />
                    </div>
                  </div>
				  
				<div class="form-group">
					<label class="col-sm-3 control-label">Log file</label>
					<div class="col-sm-9 btn-group" data-toggle="buttons">
						<label class="btn btn-primary  <?php if ($fx_sitemap_log) { echo 'active'; } ?> ">
							<input type="radio" name="fx_sitemap_log" value="1" <?php if ($fx_sitemap_log) { echo 'checked="checked"'; } ?> />
							<?php echo $text_yes; ?>
						</label>
						<label class="btn btn-primary <?php if (!$fx_sitemap_log) { echo 'active'; } ?> ">
							<input type="radio" name="fx_sitemap_log" value="0" <?php if (!$fx_sitemap_log) { echo 'checked="checked"'; } ?> />
							<?php echo $text_no; ?>
						</label>
					</div>									
				</div>
				  
        </form>
      </div>
    </div>
  </div>
</div>


<style>
<?php if((float)VERSION < 2) { ?>
#menu{display:none}
.page-header{margin-top:0}
.pull-right{padding-top: 15px}
.required {	color: #333;}
.required:after {	content: '*';}
<?php } ?>
h1 p {color:#29D!important; display:inline}
h1 span{color:#FB5151}
.alert-danger {
  background-color: #FB5151;
  border: none;
  font-size: 1.25em;
  color: #FFF; }
.delborder{border: none!important}
.btn-group > label{padding: 5px 10px;}
.btn-group > label:not(.active){opacity:.5!important;padding: 5px 10px;}
.col-sm-7 > .help-block {margin-bottom: 20px;}
.form-group + .form-group { border-top: 1px solid #ededed; }
.yes:hover{cursor: no-drop}
.form-group {
    padding-top: 15px;
    padding-bottom: 15px;
    margin-bottom: 0;
}
</style>

 <?php echo $footer; ?>