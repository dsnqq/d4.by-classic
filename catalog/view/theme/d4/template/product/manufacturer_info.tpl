<?php echo $header; ?>
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

  <div id="content">
    <div class="container">
      <div class="wrapper">
        <div class="left_wrapper"><?php echo $column_left; ?></div>
        <div class="right_wrapper"><?php echo $content_top; ?>
          <h1 class="title_h1"><?php echo $heading_title; ?></h1>
          <?php if ($products) { ?>
          <div class="row_product_panel">
            <div class="sort_panel">
              <div class="form-group input-group input-group-sm">
                <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
                <select id="input-sort" class="form-control" onchange="location = this.value;">
                  <?php foreach ($sorts as $sorts) { ?>
                  <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                  <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="see_panel">
              <div class="form-group input-group input-group-sm">
                <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
                <select id="input-limit" class="form-control" onchange="location = this.value;">
                  <?php foreach ($limits as $limits) { ?>
                  <?php if ($limits['value'] == $limit) { ?>
                  <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="btn_view_me">
              <div class="btn-group btn-group-sm btn_view_me__flex">
                <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip">

                  <svg width="18" height="15" viewBox="0 0 18 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect width="3" height="3" fill="#2C3D51"/>
                    <rect x="5.99988" width="12" height="3" fill="#2C3D51"/>
                    <rect y="6" width="3" height="3" fill="#2C3D51"/>
                    <rect x="5.99988" y="6" width="12" height="3" fill="#2C3D51"/>
                    <rect y="12" width="3" height="3" fill="#2C3D51"/>
                    <rect x="5.99988" y="12" width="12" height="3" fill="#2C3D51"/>
                  </svg>
                </button>
                <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip">
                  <svg width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect width="3" height="3" fill="#2C3D51"/>
                    <rect x="5.99988" width="3" height="3" fill="#2C3D51"/>
                    <rect y="6" width="3" height="3" fill="#2C3D51"/>
                    <rect x="5.99988" y="6" width="3" height="3" fill="#2C3D51"/>
                    <rect y="12" width="3" height="3" fill="#2C3D51"/>
                    <rect x="5.99988" y="12" width="3" height="3" fill="#2C3D51"/>
                    <rect x="12.0001" width="3" height="3" fill="#2C3D51"/>
                    <rect x="12.0001" y="6" width="3" height="3" fill="#2C3D51"/>
                    <rect x="12.0001" y="12" width="3" height="3" fill="#2C3D51"/>
                  </svg>
                </button>
              </div>
            </div>
          </div>
          <br />
          <div class="row row_s">
            <?php foreach ($products as $product) { ?>
            <div class="product-layout product-list col-xs-12" style="cursor:pointer;" onclick="location.href='<?php echo $product['href']; ?>';">
              <div class="product_this">
                <div class="product_this__left">
                  <a href="<?php echo $product['href']; ?>">
                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>">
                  </a>
                </div>
                <div class="product_this__right">
                  <div class="product_this__title"><?php echo $product['manufacturer']; ?> к <?php echo $product['auto_name'][0]['name']; ?> <?php echo $product['auto'][0]['name']; ?>, <?php echo $product['year']; ?>г.</div>
                  <div class="product_this__stay">
                    <svg width="7" height="7" viewBox="0 0 7 7" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <circle cx="3.5" cy="3.5" r="3.5" fill="#27AE60"/>
                    </svg>
                    новая з/ч
                  </div>
                  <div class="product_this__flex">
                    <div class="product_this__info">
                      <div style="font-size:14px;color:#626666;">
                        <?php if($product['location'] != ""){ ?>
                        <span><?php echo $product['location']; ?></span>
                        <?php } ?>
                        <?php if($product['width'] != "" && $product['width'] != 0){ ?>
                        <span> <?php echo $product['width']; ?>j; </span>
                        <?php } ?>
                        <?php if($product['height'] != "" && $product['height'] != 0){ ?>
                        <span style="margin-right: -4px;"><?php echo $product['height']; ?>-</span>
                        <?php } ?>
                        <?php if($product['weight'] != "" && $product['weight'] != 0){ ?>
                        <span><?php echo $product['weight']; ?>; </span>
                        <?php } ?>
                        <?php if($product['etvylet'] != "" && $product['etvylet'] != 0){ ?>
                        <span>ET-<?php echo $product['etvylet']; ?>; </span>
                        <?php } ?>
                        <?php if($product['diadiametr'] != "" && $product['diadiametr'] != 0){ ?>
                        <span>DIA-<?php echo $product['diadiametr']; ?></span>
                        <?php } ?>
                      </div>

                      <div class="product_this_info__item"><span>Описание:</span> <span><?php echo $product['description']; ?></span></div>
                      <?php if($product['objem'] != ""){ ?>
                      <div class="product_this_info__item"><span></span> <span>Объём: <?php echo $product['objem']; ?> л., <?php echo $product['type_fuel']; ?>, <?php echo $product['injection']; ?></span></div>
                      <?php } ?>
                      <div class="product_this_info__item"><span>Артикул:</span> <span><?php echo $product['model']; ?></span></div>
                      <?php if($product['sku'] != ""){ ?>
                      <div class="product_this_info__item"><span>Номер запчасти:</span> <span><?php echo $product['sku']; ?></span></div>
                      <?php } ?>
                      <?php if($product['ean'] != ""){ ?>
                      <div class="product_this_info__item"><span>Тип кузова:</span> <span><?php echo $product['ean']; ?></span></div>
                      <?php } ?>
                      <?php if($product['upc'] != ""){ ?>
                      <div class="product_this_info__item"><span>Коробка:</span> <span><?php echo $product['upc']; ?></span></div>
                      <?php } ?>




                      <?php /*
                        <div class="product_this_info__item"><span>Запчасть:</span> <span><?php echo $product['manufacturer']; ?></span></div>
                    <div class="product_this_info__item"><span>Марка:</span> <span><?php echo $product['auto_name'][0]['name']; ?></span></div>
                    <div class="product_this_info__item"><span>Модель:</span> <span><?php echo $product['auto'][0]['name']; ?></span></div>
                    <div class="product_this_info__item"><span>Год:</span> <span><?php echo $product['year']; ?></span></div>*/ ?>
                  </div>
                  <div class="product_this__price">
                    <?php if($product['special'] != ""){ ?>
                    <div class="product_this_price__main"><span style="color:red;"><?php echo $product['special']; ?></span><div style="text-decoration:line-through;"><?php echo $product['price']; ?></div></div>
                    <?php }else{ ?>
                    <div class="product_this_price__main"><?php echo $product['price']; ?></div>
                    <?php } ?>
                    <!----<div class="this_price__flex">
                      <div class="this_price_flex_item">~<?php echo $product['price_2']; ?></div>
                      <div class="this_price_flex_item">~<?php echo $product['price_3']; ?></div>
                    </div>-->
                  </div>
                </div>
                <div class="product_this__flex mt10">
                  <div class="product_this__time"><img src="/catalog/view/theme/d4/images/time.svg"><?php echo $product['date']; ?></div>
                  <a href="<?php echo $product['href']; ?>" class="product_this__btn">в корзину</a>
                </div>
              </div>
            </div>
          </div>
          <?php } ?>
        </div>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        </div>
        <?php }else{ ?>
        <div class="row">
          <div class="product-layout col-xs-12">
            <p><?php echo $text_empty; ?></p>
          </div>
        </div>
        <?php } ?>
      </div>
    </div>
  </div>
</div>
</div>
</div>


<div class="container same_text">
  <?php echo $description; ?>
</div>

<?php echo $footer; ?>
