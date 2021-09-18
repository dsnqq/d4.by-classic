<?php echo $header; ?>
<style>
.table-bordered {
    border: 1px solid #ddd;
}
.table {
    width: 100%;
    max-width: 100%;
    border-spacing: inherit;
    margin-bottom: 17px;
}
.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {
    border: 1px solid #ddd;
}
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
    padding: 8px;
    line-height: 1.42857;
    vertical-align: top;
    border-top: 1px solid #ddd;
}
</style>
<div class="container">
  <ul class="breadcrumb">
	<?php 
		$i=0;
		$count = count($breadcrumbs);
	?>
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php
			$i++;
			if ($i != $count) {	
		?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } else{ ?>
			<li style="font-size: 14px;line-height: 20px;color: #8D9293;text-decoration: none;"><?php echo $breadcrumb['text']; ?></li>
		<?php } ?>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <div id="content"><?php echo $content_top; ?>
      <h1 class="title_h1"><?php echo $heading_title; ?></h1>
      <div class="same_text">
        <?php echo $description; ?>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>