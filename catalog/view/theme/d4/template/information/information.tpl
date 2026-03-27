<?php
/**
 * Диспетчер информационных страниц.
 * Для страниц с кастомным шаблоном подгружает:
 *   - CSS:  /catalog/view/theme/d4/css/pages/{slug}.css
 *   - HTML: information/pages/{slug}.tpl
 * Для остальных страниц выводит $description из БД как обычно.
 *
 * Маппинг information_id → slug:
 *   4  → about_us   (/about_us)
 *   6  → delivery   (/delivery)
 *   7  → kontakty   (/kontakty)
 *   10 → garantyja  (/garantyja)
 */
$page_map = [
    4  => 'about_us',
    6  => 'delivery',
    7  => 'kontakty',
    8  => 'otvety-na-voprosy',
    10 => 'garantyja',
];
$page_slug = isset($page_map[$information_id]) ? $page_map[$information_id] : null;
$page_tpl  = $page_slug ? dirname(__FILE__) . '/pages/' . $page_slug . '.tpl' : null;
$page_css  = $page_slug ? '/catalog/view/theme/d4/css/pages/' . $page_slug . '.css' : null;
?>
<?php echo $header; ?>
<style>
/* ===== TABLE STYLES (global for all info pages) ===== */
.table-bordered { border: 1px solid #ddd; }
.table { width: 100%; max-width: 100%; border-spacing: inherit; margin-bottom: 17px; }
.table-bordered > thead > tr > th, .table-bordered > tbody > tr > th,
.table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td,
.table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td { border: 1px solid #ddd; }
.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th,
.table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
    padding: 8px; line-height: 1.42857; vertical-align: top; border-top: 1px solid #ddd;
}
</style>

<?php if ($page_css): ?>
<link rel="stylesheet" href="<?php echo $page_css; ?>">
<?php endif; ?>

<div class="container">
    <ul class="breadcrumb">
        <?php $i = 0; $count = count($breadcrumbs); ?>
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php $i++; if ($i != $count) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } else { ?>
                <li style="font-size:14px;line-height:20px;color:#8D9293;text-decoration:none;"><?php echo $breadcrumb['text']; ?></li>
            <?php } ?>
        <?php } ?>
    </ul>

    <div class="row"><?php echo $column_left; ?>
        <div id="content"><?php echo $content_top; ?>
            <h1 class="title_h1"><?php echo $heading_title; ?></h1>

            <?php if ($page_tpl && file_exists($page_tpl)): ?>
                <?php include $page_tpl; ?>
            <?php else: ?>
                <div class="same_text"><?php echo $description; ?></div>
            <?php endif; ?>

            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>

<?php echo $footer; ?>
