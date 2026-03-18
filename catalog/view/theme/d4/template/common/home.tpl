<?php echo $header; ?>

<div id="content">
  <div class="container">
    <div class="wrapper">
        <div class="left_wrapper"><?php echo $column_left; ?></div>
        <div class="right_wrapper">
            <?php echo $content_top; ?>
        </div>
    </div>
    <div style="
    font-size: 16px;
    line-height: 26px;
    color: #626666;">
            <?php echo $content_bottom; ?>
            </div>
  </div>

  <div class="container">
      <div class="auto_all_link">
          <div class="title_d">Запчасти б/у для автомобилей</div>
          <div class="grid_template_auto">
              <?php foreach ($categories as $category) { ?>
              <a href="<?php echo $category['href']; ?>" style="padding-left:10px;">
                <?php echo $category['name']; ?>
                <small><?php echo $category['product_count']; ?></small>
              </a>
              <?php } ?>
          </div>
      </div>
  </div>
  <div class="about">
      <div class="auto_all_link container">
          <div class="adishional_icons">
              <div class="adishional_icons__item">
                <div class="adishional_icons_item__img"><img src="/catalog/view/theme/d4/images/icon1.svg"></div>
                <div class="adishional_icons_item__t1">Более 80 000 запчастей в наличии</div>
                <div class="adishional_icons_item__t2">Крупнейшее наличие б/у<br> запчастей в РБ</div>
              </div>
              <div class="adishional_icons__item">
                <div class="adishional_icons_item__img"><img src="/catalog/view/theme/d4/images/icon2.svg"></div>
                <div class="adishional_icons_item__t1">Гарантия до 30 дней</div>
                <div class="adishional_icons_item__t2">проверочный срок</div>
              </div>
              <div class="adishional_icons__item">
                <div class="adishional_icons_item__img"><img src="/catalog/view/theme/d4/images/icon3.svg"></div>
                <div class="adishional_icons_item__t1">Доставка в РФ и Казахстан</div>
                <div class="adishional_icons_item__t2">а также во все<br> области и города РБ</div>
              </div>
              <div class="adishional_icons__item">
                <div class="adishional_icons_item__img"><img src="/catalog/view/theme/d4/images/icon4.svg"></div>
                <div class="adishional_icons_item__t1">Мгновенный поиск запчастей</div>
                <div class="adishional_icons_item__t2">Единая база данных</div>
              </div>
          </div>
      </div>
  </div>
</div>

<?php echo $footer; ?>