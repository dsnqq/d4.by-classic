<div class="row news_seo">
	<?php foreach ($news as $news_item) { ?>
		<a href="<?php echo $news_item['href']; ?>"><?php echo $news_item['title']; ?></a>
	<?php } ?>
</div>