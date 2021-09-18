<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?>
    <div style="margin:0px -10px;">
        <?php foreach ($categories as $category) { ?>
        <a href="<?php echo $category['href']; ?>" style="padding-left:10px;"><?php echo $category['name']; ?></a>
        <?php } ?>
    </div>
  </div>
</div>

<?php echo $footer; ?>