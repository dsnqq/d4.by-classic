<?php if($products_in_category){ ?>
<style>
  .row_s.view{
    grid-template-columns: 1fr 1fr 1fr 1fr;
  }
  </style>
<section class="products_in_category">
  <div class="container">
    <div class="title">
      <div class="title_d">Похожие запчасти</div>
    </div>
    <div class="slider">
      <div class="row row_s view">
        <?php foreach ($products_in_category as $product) { ?>
          <div class="product-layout product-list">
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
                      <div class="product_this_info__item"><span>Описание:</span> <span><?php echo $product['description']; ?></span></div>
                      <?php if($product['objem'] != ""){ ?>
                        <div class="product_this_info__item"><span></span> <span>Объём: <?php echo $product['objem']; ?> л., <?php echo $product['type_fuel']; ?>, <?php echo $product['injection']; ?></span></div>
                        <?php } ?>
                        <div class="product_this_info__item"><span>Артикул:</span> <span><?php echo $product['model']; ?></span></div>
                        <?php if($product['sku'] != ""){ ?>
                        <div class="product_this_info__item"><span>Номер запчасти:</span> <span><?php echo $product['sku']; ?></span></div>
                        <?php } ?>
                        <?php /*
                        <div class="product_this_info__item"><span>Запчасть:</span> <span><?php echo $product['manufacturer']; ?></span></div>
                        <div class="product_this_info__item"><span>Марка:</span> <span><?php echo $product['auto_name'][0]['name']; ?></span></div>
                        <div class="product_this_info__item"><span>Модель:</span> <span><?php echo $product['auto'][0]['name']; ?></span></div>
                        <div class="product_this_info__item"><span>Год:</span> <span><?php echo $product['year']; ?></span></div>*/ ?>
                      </div>
                    </div>
                    <div class="product_this__grid">
                      <div class="product_this__time"><img src="/catalog/view/theme/d4/images/time.svg"><?php echo $product['date']; ?></div>
                      <div class="product_this__price">
	   <?php if($product['special'] != ""){ ?>
            <div class="product_this_price__main"><span style="color:red;"><?php echo $product['special']; ?></span><div style="text-decoration:line-through;"><?php echo $product['price']; ?></div></div>
	  <?php }else{ ?>
            <div class="product_this_price__main"><?php echo $product['price']; ?></div>
	  <?php } ?>
                        <?php if (!empty($product['price_2']) || !empty($product['price_3'])) { ?>
                        <div class="this_price__flex">
                          <?php if (!empty($product['price_2'])) { ?><div class="this_price_flex_item">~<?php echo $product['price_2']; ?></div><?php } ?>
                          <?php if (!empty($product['price_3'])) { ?><div class="this_price_flex_item">~<?php echo $product['price_3']; ?></div><?php } ?>
                        </div>
                        <?php } ?>
                      </div>
                      <a href="<?php echo $product['href']; ?>" class="product_this__btn">в корзину</a>
                    </div>
                  </div>
                </div>
              </div>
        <?php } ?>
      </div>
    </div>
  </div>
</section>
<script>
  $(document).ready(function() {
    window.onload = function(){
      $('.row_s').addClass('view');
    }
  });
</script>
<?php } ?> 