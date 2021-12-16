<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" >
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?><!----
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />--->
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<?php  if ((strpos($_SERVER['REQUEST_URI'], "index.php?route=catalog/product/edit") != false) || (strpos($_SERVER['REQUEST_URI'], "index.php?route=catalog/shiny/edit") != false)) { ?>
  <script src="view/javascript/jquery-ui.min.js"></script>
  <script type="text/javascript">
      function touchHandler(event) {
          var touch = event.changedTouches[0];

          var simulatedEvent = document.createEvent("MouseEvent");
          simulatedEvent.initMouseEvent({
                  touchstart: "mousedown",
                  touchmove: "mousemove",
                  touchend: "mouseup"
              }[event.type], true, true, window, 1,
              touch.screenX, touch.screenY,
              touch.clientX, touch.clientY, false,
              false, false, false, 0, null);

          touch.target.dispatchEvent(simulatedEvent);
          //event.preventDefault();
      }

      function touch_init() {
          document.addEventListener("touchstart", touchHandler, true);
          document.addEventListener("touchmove", touchHandler, true);
          document.addEventListener("touchend", touchHandler, true);
          document.addEventListener("touchcancel", touchHandler, true);
      }
      $(function() {
          touch_init();
          $('#preview .row.itemsBlockFlex').sortable({
              update: function() {
                  $('.itemsBlock').each(function() {
                      $(this).find('.sort_order').val($(this).index());
                      if($(this).index() == 1){
                          $(this).find('button.main_image').trigger('click');
                      }
                  });
              }
          });
      });
  </script>
  <?php } ?>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="view/stylesheet/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<script src="view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
<script src="view/javascript/jquery/datetimepicker/locale/<?php echo $code; ?>.js" type="text/javascript"></script>
<script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="screen" />
<?php foreach ($styles as $style) { ?>
<link type="text/css" href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
</head>
<body>
<style>
.status_favourite{
  cursor:pointer;
}
.table-responsive{
  overflow-x: inherit !important;
}
</style>
<div id="container">
<header id="header" class="navbar navbar-static-top">
  <div class="navbar-header">
    <?php if ($logged) { ?>
    <a type="button" id="button-menu" class="pull-left"><i class="fa fa-indent fa-lg"></i></a>
    <?php } ?>
    <a href="<?php echo $home; ?>" class="navbar-brand">Автозапчасти</a></div>
  <?php if ($logged) { ?>
  <ul class="nav pull-right">
    <?php if($user_id == 1 || $user_id == 2 || $user_id == 7){ ?>
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown">
        <?php //if($processing_status_total > 0) { ?>
          <span class="label <?php if($processing_status_total > 0) { ?>label-danger <?php } ?> pull-left"><?php echo $processing_status_total; ?></span>
        <?php //} ?> <i <?php if($processing_status_total > 0) { ?>style="color:#f56b6b;"<?php } ?> class="fa fa-bell fa-lg"></i>
      </a>
      <ul class="dropdown-menu dropdown-menu-right alerts-dropdown">
        <li class="dropdown-header"><?php echo $text_order; ?></li>
        <li><a href="<?php echo $processing_status; ?>" style="display: block; overflow: auto;"><span class="label label-warning pull-right"><?php echo $processing_status_total; ?></span>Посмотреть</a></li>
      </ul>
    </li> 
    <?php } ?>
    <li class="dropdown">
      <?php foreach ($stores as $store) { ?>
        <a href="<?php echo $store['href']; ?>" target="_blank"><i class="fa fa-home fa-lg"></i></a>
      <?php } ?>
    </li>
    <li><a href="<?php echo $logout; ?>"><span class="hidden-xs hidden-sm hidden-md"><?php echo $text_logout; ?></span> <i class="fa fa-sign-out fa-lg"></i></a></li>
  </ul>
  <?php } ?>
</header>
