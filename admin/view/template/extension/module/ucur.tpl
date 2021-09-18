<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-pp-layout" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-pp-layout" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-license"><?php echo $entry_license; ?></label>
            <div class="col-sm-10">
              <input type="text" name="ucur_license" id="input-license" class="form-control" value="<?php echo $ucur_license; ?>" />
              <?php if ($error_license) { ?>
              <div class="text-danger"><?php echo $error_license; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-callback"><?php echo $entry_callback; ?></label>
            <div class="col-sm-10">
              <div id="input-callback" class="form-control"><?php echo $entry_cron; ?></div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-addr"><?php echo $entry_addr; ?></label>
            <div class="col-sm-10">
              <select name="ucur_addr" id="input-addr" class="form-control">
                <?php if ($ucur_addr == 'govua') { ?>
                <option value="0"><?php echo $text_cbrf; ?></option>
                <option value="govua" selected="selected"><?php echo $text_govua; ?></option>
                <option value="privat"><?php echo $text_privat; ?></option>
                <option value="privat2"><?php echo $text_privat; ?> 2</option>
                <option value="privat3"><?php echo $text_privat; ?> 3</option>
                <option value="privat4"><?php echo $text_privat; ?> 4</option>
                <option value="nbrb"><?php echo $text_nbrb; ?></option>
                <option value="ecbt"><?php echo $text_ecb; ?></option>
                <?php } else if ($ucur_addr == 'privat') { ?>
                <option value="0"><?php echo $text_cbrf; ?></option>
                <option value="govua"><?php echo $text_govua; ?></option>
                <option value="privat" selected="selected"><?php echo $text_privat; ?></option>
                <option value="privat2"><?php echo $text_privat; ?> 2</option>
                <option value="privat3"><?php echo $text_privat; ?> 3</option>
                <option value="privat4"><?php echo $text_privat; ?> 4</option>
                <option value="nbrb"><?php echo $text_nbrb; ?></option>
                <option value="ecbt"><?php echo $text_ecb; ?></option>
                <?php } else if ($ucur_addr == 'privat2') { ?>
                <option value="0"><?php echo $text_cbrf; ?></option>
                <option value="govua"><?php echo $text_govua; ?></option>
                <option value="privat"><?php echo $text_privat; ?></option>
                <option value="privat2" selected="selected"><?php echo $text_privat; ?> 2</option>
                <option value="privat3"><?php echo $text_privat; ?> 3</option>
                <option value="privat4"><?php echo $text_privat; ?> 4</option>
                <option value="nbrb"><?php echo $text_nbrb; ?></option>
                <option value="ecbt"><?php echo $text_ecb; ?></option>
                <?php } else if ($ucur_addr == 'privat3') { ?>
                <option value="0"><?php echo $text_cbrf; ?></option>
                <option value="govua"><?php echo $text_govua; ?></option>
                <option value="privat"><?php echo $text_privat; ?></option>
                <option value="privat2"><?php echo $text_privat; ?> 2</option>
                <option value="privat3" selected="selected"><?php echo $text_privat; ?> 3</option>
                <option value="privat4"><?php echo $text_privat; ?> 4</option>
                <option value="nbrb"><?php echo $text_nbrb; ?></option>
                <option value="ecbt"><?php echo $text_ecb; ?></option>
                <?php } else if ($ucur_addr == 'privat4') { ?>
                <option value="0"><?php echo $text_cbrf; ?></option>
                <option value="govua"><?php echo $text_govua; ?></option>
                <option value="privat"><?php echo $text_privat; ?></option>
                <option value="privat2"><?php echo $text_privat; ?> 2</option>
                <option value="privat3"><?php echo $text_privat; ?> 3</option>
                <option value="privat4" selected="selected"><?php echo $text_privat; ?> 4</option>
                <option value="nbrb"><?php echo $text_nbrb; ?></option>
                <option value="ecbt"><?php echo $text_ecb; ?></option>
                <?php } else if ($ucur_addr == 'nbrb') { ?>
                <option value="0"><?php echo $text_cbrf; ?></option>
                <option value="govua"><?php echo $text_govua; ?></option>
                <option value="privat"><?php echo $text_privat; ?></option>
                <option value="privat2"><?php echo $text_privat; ?> 2</option>
                <option value="privat3"><?php echo $text_privat; ?> 3</option>
                <option value="privat4"><?php echo $text_privat; ?> 4</option>
                <option value="nbrb" selected="selected"><?php echo $text_nbrb; ?></option>
                <option value="ecbt"><?php echo $text_ecb; ?></option>
                <?php } else if ($ucur_addr == 'ecbt') { ?>
                <option value="0"><?php echo $text_cbrf; ?></option>
                <option value="govua"><?php echo $text_govua; ?></option>
                <option value="privat"><?php echo $text_privat; ?></option>
                <option value="privat2"><?php echo $text_privat; ?> 2</option>
                <option value="privat3"><?php echo $text_privat; ?> 3</option>
                <option value="privat4"><?php echo $text_privat; ?> 4</option>
                <option value="nbrb"><?php echo $text_nbrb; ?></option>
                <option value="ecbt" selected="selected"><?php echo $text_ecb; ?></option>
                <?php } else { ?>
                <option value="0" selected="selected"><?php echo $text_cbrf; ?></option>
                <option value="govua"><?php echo $text_govua; ?></option>
                <option value="privat"><?php echo $text_privat; ?></option>
                <option value="privat2"><?php echo $text_privat; ?> 2</option>
                <option value="privat3"><?php echo $text_privat; ?> 3</option>
                <option value="privat4"><?php echo $text_privat; ?> 4</option>
                <option value="nbrb"><?php echo $text_nbrb; ?></option>
                <option value="ecbt"><?php echo $text_ecb; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-proc"><?php echo $entry_proc; ?></label>
            <div class="col-sm-10">
              <input type="text" name="ucur_proc" id="input-proc" class="form-control" value="<?php echo $ucur_proc; ?>" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="ucur_status" id="input-status" class="form-control">
                <?php if ($ucur_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div><p style="text-align:center;">UCur Ver. <?php echo $version; ?></p>
    </div>
  </div>
</div>
<?php echo $footer; ?>