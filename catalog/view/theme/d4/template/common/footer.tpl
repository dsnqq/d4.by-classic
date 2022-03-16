
<?php if ($route != 'common/home') {?>
  <div class="container">
      <div class="auto_all_link">
          <div class="title_d">Запчасти б/у для автомобилей</div>
          <div class="grid_template_auto">
              <?php foreach ($categories as $category) { ?>
              <a href="<?php echo $category['href']; ?>" style="padding-left:10px;"><?php echo $category['name']; ?></a>
              <?php } ?>
          </div>
      </div>
  </div>
<?php } ?>


<footer>
  <div class="footer_top">
    <div class="container">
      <div class="flex_main_footer">
        <div class="main_footer_left">
          <a href="/">
            <img src="/catalog/view/theme/d4/images/footer_logo.svg">  
          </a>
          <!---<div class="main_footer_left_text">D4.by - это торговая интернет-площадка, где можно заказать и получить запчасти для автомобилей и любой техники практически со всего мира.</div>-->
          <?php /*<div class="click_phone_this"><a href="tel:+375298000736" style="color: #fff;text-decoration: none;">+375 (29) 800-07-36</a></div>
          <div class="click_phone_this"><a href="tel:+375296416496" style="color: #fff;text-decoration: none;">+375 (29) 641-64-96</a></div>
          <div class="click_phone_this"><a href="tel:+375297953619" style="color: #fff;text-decoration: none;">+375 (29) 795-36-19</a></div>*/ ?>

          <div class="click_phone_this"><a href="tel:+375296416496" style="color: #fff;text-decoration: none;">+375 (29) 641-64-96</a></div>
          <div class="click_phone_this"><a href="tel:+375298000736" style="color: #fff;text-decoration: none;">+375 (29) 800-07-36</a></div>
          <div class="click_phone_this"><a href="tel:+375297953619" style="color: #fff;text-decoration: none;">+375 (29) 795-26-40</a></div>
<br>
          <div style="color:#fff;">Дрогичин, Заводская 20<br> ПН-СБ 9.00-18.00, ВС 10.00-13.00</div><br>
          <div style="color:#fff;">Брест, ул. Московская 364, ряд 5а пав.5/1<br>
ПН-СБ 9.00-15.00, ВС -выходной</div>

          <!---<div class="btn_footer_call">Заказать звонок</div>-->
        </div>
        <div class="main_footer_right">
          <div class="footer_menu">
            <?php //TODO: footer menu ocmod?>
          </div>
          <img src="/catalog/view/theme/d4/images/paymant.jpg" class="paymant_img">
        </div>
      </div>
    </div>
  </div>
  <div class="footer_bottom">
    <div class="container">
      <div class="flex_bottom_foot">
          <div>© 2006-2021 Компания «D4.by», УНП 290794808</div>
          <div><a href="/privacy">Политика конфиденциальности</a></div>
          <div><a href="https://internetsozdateli.by/">Продвижение и создание сайтов - InternetSozdateli</a></div>
      </div>
    </div>
  </div>
</footer>
<?php // Для фильтра?>
<link type="text/css" href="/catalog/view/javascript/bootstrap/css/bootstrap-ew.css" rel="stylesheet" media="screen" />
<link type="text/css" href="catalog/view/stylesheet/bootstrap-select.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap-select.js"></script>
<script src="catalog/view/javascript/jquery.chained.js"></script>

<script>
$(document).ready(function() { // 
  $('.same_pick').selectpicker();
 // $("#same_0").chained("#same_1");
  $("#same_0").change(function(){
    function render() {
      $("#same_1").selectpicker('render');
      $("#same_1").selectpicker('refresh');
    }
    setTimeout(render, 1000); 
    
  });
});

      if ($(window).width() <= '991'){
          $('#content .product-grid > .clearfix').remove();
  
          $('#content .row > .product-grid').attr('class', 'product-layout product-list col-xs-12');
          $('#grid-view').removeClass('active');
          $('#list-view').addClass('active');
          $('.row_s').addClass('view');
          
          localStorage.setItem('display', 'list');
      }

</script>


		<script>
			$('.dynamic-label-input').change(function(){
				if($(this).val() != ""){
					$(this).next('.placeholder').addClass('active');
				} else {
					$(this).next('.placeholder').removeClass('active');
				}
			});
			
			$(document).ready(function() { 
			
				if($('.dynamic-label-input').val() != ""){
					$('.dynamic-label-input').next('.placeholder').addClass('active');
				} else {
					$('.dynamic-label-input').next('.placeholder').removeClass('active');
				}
			
			});
		</script>
</body></html>