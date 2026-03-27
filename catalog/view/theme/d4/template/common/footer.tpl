<div class="widget_curse ">
	<div class="panel panel-primary">
	  <div class="panel-heading">
		<h4 class="panel-title" style="text-align:center;">Курсы валют</h4></div>
	  <div class="widget_curse--body">
	  <table class="table table-striped table-hover">
		<tbody>
			<td style="white-space: nowrap; text-overflow:ellipsis; overflow: hidden; max-width:160px;"><img src="//static.currencyrate.today/f/i/flags/us.png" width="16" height="11" alt="USD" loading="lazy"> <span>Доллар США</span></td>
			<td class="text-right"><span class="label label-default"><?php echo round($currencies['BYN']['value'], 2); ?></span></td>
		  </tr>
		  <tr>
			<td style="white-space: nowrap; text-overflow:ellipsis; overflow: hidden; max-width:160px;"><img src="//static.currencyrate.today/f/i/flags/ru.png" width="16" height="11" alt="RUB" loading="lazy"> <span>Российский Рубль</span></td>
			<td class="text-right"> <span title="-13.84910" class="label label-danger"><?php echo round($currencies['RUB']['value'], 2); ?></span></td>
		  </tr>
		  <tr>
		</tbody>
	  </table>
	  <div class="panel-footer">
		<p class="text-muted pull-right" style="font-size:10px;padding-top:9px;text-align: center;"><?php echo date('d.m.Y'); ?></p>
	  </div>
	  </div>
	</div>
</div>

<?php if ($route != 'common/home') { ?>
  <div class="container" style="padding-bottom: 100px;">
      <div class="auto_all_link">
          <div class="title_d">Запчасти б/у для автомобилей</div>
          <div class="grid_template_auto">
              <?php foreach ($categories as $category) { ?>
              <a href="<?php echo $category['href']; ?>" style="padding-left:10px;">
                <?php echo $category['name']; ?>
              </a>
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
            <p>Автозапчасти Б/у из Европы</p>
            <span>Найдите нужную запчасть для своего автомобиля</span>
            <a href="/index.php?route=module/mega_filter/results">Поиск запчастей</a>
        </div>
        <div class="main_footer_right">
          <div class="footer_menu">
            <div class="footer_menu__item">
              <div class="footer_menu_title">Телефоны для связи</div> 
              <ul class="footer_menu_lists"> 
                <li class="click_phone_this"><a href="tel:+375298000736" style="color: #fff;text-decoration: none;">+375 (29) 800-07-36</a></li>
                <li class="click_phone_this">
                  <a href="/viber">
                    <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <circle cx="15" cy="15" r="15" fill="#7360F2"/>
                      <path d="M20.4111 9.34108C20.0333 8.99257 18.507 7.88454 15.1072 7.86949C15.1072 7.86949 11.098 7.62772 9.14351 9.42046C8.05555 10.5086 7.67283 12.1009 7.63246 14.075C7.59209 16.049 7.53986 19.7485 11.1059 20.7516H11.1094L11.1071 22.2823C11.1071 22.2823 11.0843 22.902 11.4923 23.0284C11.9859 23.1816 12.2755 22.7106 12.7468 22.2029C13.0054 21.9242 13.3626 21.5148 13.6317 21.2019C16.0706 21.4071 17.9464 20.938 18.1594 20.8686C18.6518 20.709 21.4383 20.3518 21.8915 16.6528C22.3593 12.8399 21.6653 10.4281 20.4111 9.34108ZM20.8243 16.3793C20.4418 19.468 18.1818 19.6621 17.7651 19.7957C17.5878 19.8528 15.9404 20.2626 13.8687 20.1274C13.8687 20.1274 12.325 21.9897 11.8429 22.4739C11.7676 22.5496 11.6791 22.5802 11.62 22.5651C11.537 22.5448 11.5142 22.4465 11.5151 22.3028C11.5165 22.0976 11.5283 19.7592 11.5283 19.7592C11.5265 19.7592 11.5283 19.7592 11.5283 19.7592C8.51172 18.9217 8.68757 15.773 8.72178 14.1242C8.756 12.4754 9.06573 11.1247 9.98582 10.2162C11.639 8.71887 15.0445 8.94262 15.0445 8.94262C17.9204 8.95517 19.2985 9.8212 19.618 10.1113C20.679 11.0198 21.2196 13.1936 20.8243 16.3784V16.3793Z" fill="white"/>
                      <path fill-rule="evenodd" clip-rule="evenodd" d="M15.1653 12.7901C15.1708 12.6841 15.2613 12.6026 15.3673 12.6081C15.7641 12.6288 16.0942 12.7489 16.3293 12.992C16.5635 13.2341 16.6783 13.5724 16.6984 13.9787C16.7037 14.0847 16.622 14.175 16.5159 14.1803C16.4099 14.1855 16.3196 14.1038 16.3144 13.9977C16.2971 13.65 16.2017 13.4132 16.0529 13.2593C15.9049 13.1064 15.6792 13.0095 15.3473 12.9921C15.2413 12.9866 15.1598 12.8962 15.1653 12.7901Z" fill="white"/>
                      <path fill-rule="evenodd" clip-rule="evenodd" d="M14.8738 11.7545C14.8816 11.6486 14.9737 11.5691 15.0796 11.5768C15.887 11.6359 16.5369 11.9118 17.0103 12.4285L17.0104 12.4286C17.4787 12.9403 17.7012 13.5768 17.6851 14.3234C17.6828 14.4296 17.5948 14.5138 17.4887 14.5115C17.3825 14.5092 17.2983 14.4212 17.3006 14.3151C17.3149 13.6567 17.1212 13.1193 16.7267 12.6882C16.3334 12.2589 15.7836 12.0139 15.0515 11.9603C14.9456 11.9526 14.8661 11.8604 14.8738 11.7545Z" fill="white"/>
                      <path fill-rule="evenodd" clip-rule="evenodd" d="M14.5342 10.77C14.5349 10.6638 14.6216 10.5783 14.7278 10.579C15.8436 10.5868 16.7868 10.9583 17.5441 11.6965C18.3077 12.4409 18.6853 13.4543 18.6949 14.713C18.6957 14.8191 18.6103 14.9059 18.5041 14.9067C18.3979 14.9075 18.3111 14.8221 18.3103 14.7159C18.3014 13.5365 17.9505 12.6297 17.2756 11.9719C16.5945 11.3078 15.7487 10.9707 14.7251 10.9636C14.6189 10.9628 14.5334 10.8762 14.5342 10.77Z" fill="white"/>
                      <path d="M15.3954 16.564C15.3954 16.564 15.6656 16.5868 15.8112 16.4075L16.0949 16.0506C16.2317 15.8736 16.562 15.7607 16.8854 15.9409C17.1278 16.0791 17.3631 16.2294 17.5904 16.3911C17.8051 16.549 18.2446 16.9157 18.2459 16.9157C18.4553 17.0925 18.5037 17.352 18.3611 17.6257C18.3611 17.6273 18.36 17.6301 18.36 17.6314C18.203 17.9036 18.0037 18.1491 17.7695 18.3586C17.7667 18.3599 17.7667 18.3613 17.7642 18.3627C17.5608 18.5327 17.3609 18.6293 17.1646 18.6526C17.1357 18.6576 17.1063 18.6595 17.077 18.658C16.9905 18.6589 16.9043 18.6456 16.822 18.6188L16.8156 18.6095C16.5132 18.5242 16.0082 18.3107 15.1673 17.8467C14.6806 17.5814 14.2173 17.2754 13.7824 16.9319C13.5643 16.7598 13.3564 16.5754 13.1595 16.3795L13.1385 16.3585L13.1175 16.3375L13.0965 16.3165C13.0894 16.3097 13.0826 16.3026 13.0755 16.2956C12.8796 16.0987 12.6952 15.8907 12.5231 15.6727C12.1797 15.2377 11.8736 14.7745 11.6083 14.288C11.1443 13.4468 10.9309 12.9423 10.8456 12.6394L10.8362 12.633C10.8095 12.5507 10.7963 12.4645 10.7972 12.378C10.7956 12.3487 10.7974 12.3193 10.8024 12.2904C10.8269 12.0944 10.9237 11.8944 11.0928 11.6903C11.0942 11.6878 11.0955 11.6878 11.0969 11.6851C11.3064 11.4509 11.5518 11.2516 11.824 11.0948C11.8254 11.0948 11.8281 11.0934 11.8297 11.0934C12.1034 10.9509 12.363 10.9992 12.5395 11.2075C12.5409 11.2088 12.907 11.6484 13.0641 11.863C13.2259 12.0905 13.3762 12.3261 13.5144 12.5687C13.6945 12.8919 13.5816 13.2228 13.4046 13.3592L13.0477 13.6429C12.8675 13.7885 12.8912 14.0587 12.8912 14.0587C12.8912 14.0587 13.4199 16.0597 15.3954 16.564Z" fill="white"/>
                    </svg>
                  </a>
                  <a href="/whatsapp">
                    <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <circle cx="15" cy="15" r="15" fill="#48C95F"/>
                      <path d="M20.9451 9.04687C19.4634 7.57031 17.4878 6.75 15.4024 6.75C11.0671 6.75 7.55488 10.25 7.55488 14.5703C7.55488 15.9375 7.93902 17.3047 8.59756 18.4531L7.5 22.5L11.6707 21.4062C12.8232 22.0078 14.0854 22.3359 15.4024 22.3359C19.7378 22.3359 23.25 18.8359 23.25 14.5156C23.1951 12.4922 22.4268 10.5234 20.9451 9.04687ZM19.189 17.3594C19.0244 17.7969 18.2561 18.2344 17.872 18.2891C17.5427 18.3437 17.1037 18.3438 16.6646 18.2344C16.3902 18.125 16.0061 18.0156 15.5671 17.7969C13.5915 16.9766 12.3293 15.0078 12.2195 14.8438C12.1098 14.7344 11.3963 13.8047 11.3963 12.8203C11.3963 11.8359 11.8902 11.3984 12.0549 11.1797C12.2195 10.9609 12.439 10.9609 12.6037 10.9609C12.7134 10.9609 12.878 10.9609 12.9878 10.9609C13.0976 10.9609 13.2622 10.9062 13.4268 11.2891C13.5915 11.6719 13.9756 12.6562 14.0305 12.7109C14.0854 12.8203 14.0854 12.9297 14.0305 13.0391C13.9756 13.1484 13.9207 13.2578 13.811 13.3672C13.7012 13.4766 13.5915 13.6406 13.5366 13.6953C13.4268 13.8047 13.3171 13.9141 13.4268 14.0781C13.5366 14.2969 13.9207 14.8984 14.5244 15.4453C15.2927 16.1016 15.8963 16.3203 16.1159 16.4297C16.3354 16.5391 16.4451 16.4844 16.5549 16.375C16.6646 16.2656 17.0488 15.8281 17.1585 15.6094C17.2683 15.3906 17.4329 15.4453 17.5976 15.5C17.7622 15.5547 18.75 16.0469 18.9146 16.1562C19.1341 16.2656 19.2439 16.3203 19.2988 16.375C19.3537 16.5391 19.3537 16.9219 19.189 17.3594Z" fill="white"/>
                    </svg>
                  </a>
                  <a href="/telegram">
                    <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <circle cx="15" cy="15" r="15" fill="#29B6F6"/>
                      <path d="M7.01303 15.2806L10.4616 16.5665L11.8059 20.8918C11.8644 21.184 12.2151 21.2425 12.4489 21.0671L14.3778 19.489C14.5531 19.3136 14.8454 19.3136 15.0792 19.489L18.5277 22.0023C18.7615 22.1777 19.1122 22.0608 19.1707 21.7685L21.7425 9.49399C21.8009 9.20174 21.5087 8.90949 21.2164 9.02639L7.01303 14.5207C6.66232 14.6376 6.66232 15.1637 7.01303 15.2806ZM11.6306 15.9235L18.4108 11.7735C18.5277 11.7151 18.6446 11.8905 18.5277 11.9489L12.975 17.151C12.7996 17.3263 12.6242 17.5601 12.6242 17.8524L12.4489 19.2552C12.4489 19.4305 12.1566 19.489 12.0982 19.2552L11.3968 16.6834C11.2214 16.3911 11.3384 16.0404 11.6306 15.9235Z" fill="white"/>
                    </svg>
                  </a>
                </li>
                <li class="click_phone_this"><a href="tel:+375297952640" style="color: #fff;text-decoration: none;">+375 (29) 795-26-40</a></li>
                <li class="click_phone_this"><a href="tel:+375296416496" style="color: #fff;text-decoration: none;">+375 (29) 641-64-96</a></li>
              </ul>
            </div>
            <div class="footer_menu__item">
              <div class="footer_menu_title">Адрес магазинов</div> 
              <ul class="footer_menu_lists"> 
                <li>
                  <address>Дрогичин, Заводская 20</address>
                  <div>ПН-СБ 9.00-18.00, ВС 10.00-13.00</div>
                </li>
                <li>
                  <address>Брест, ул. Московская 364, пав.6 (Пункт выдачи)</address>
                  <div>ВТ-СБ 9.00-15.30, ВС 10.00 - 15.00, ПН-выходной</div>
                </li>
              </ul>
            </div>
            <div class="footer_menu__item">
              <div class="footer_menu_title">Меню</div> 
              <ul class="footer_menu_lists"> 
                <li>
                  <a href="/index.php?route=module/mega_filter/results">Поиск запчастей</a>
                </li>
                <li>
                  <a href="/about_us">О компании</a>
                </li>
                <li>
                  <a href="/otvety-na-voprosy">Ответы на вопросы</a>
                </li>
                <li>
                  <a href="/delivery">Доставка и оплата</a>
                </li>
                <li>
                  <a href="/kontakty">Контакты</a>
                </li>
              </ul>
            </div>
            <?php // footer menu ocmod?>
            <?php if ($footer_titles) { foreach ($footer_titles as $footer_title) { ?>
		   <div class="footer_menu__item">
              <div class="footer_menu_title"><?php echo $footer_title['title']; ?></div>
			  <ul class="footer_menu_lists">
				<?php foreach ($footer_title['sub_title'] as $subtitle) { ?>
				<li><a href="<?php echo !empty($subtitle['href']) ? $subtitle['href'] : $subtitle['link']; ?>"><?php echo $subtitle['title']; ?></a></li>
				<?php } ?>
			  </ul>
            </div>
		  <?php } } ?>
          </div>
          <img src="/catalog/view/theme/d4/images/paymant.png" class="paymant_img">
        </div>
      </div>
    </div>
  </div>
  <div class="footer_bottom">
    <div class="container">
      <div class="flex_bottom_foot">
          <div>© 2006-2024 Компания «D4.by», УНП 290794808</div>
          <div><a href="/privacy">Политика конфиденциальности</a></div>
          <div><a href="https://internetsozdateli.by/">Продвижение и создание сайтов - InternetSozdateli</a></div>
      </div>
    </div>
  </div>
</footer>
<div class="footer-information-x">
    <div>
        В торговом реестре с 27 ноября 2020 г., № регистрации 497114, УНП 290794808. Регистрация в МНС 26.07.2006.<br>
        Адрес магазина: г.Дрогичин ул.Заводская 20; Пункт выдачи: Брест, ул. Московская 364, пав.6;<br>
        Юр.адрес: 225641, Дрогичинский р-н.,д. Белинок, ул. Набережная,д. 13А; E-mail: info@d4.by<br>
        <span style="font-size: 9px;">Уполномоченное лицо Дрогичинского РИК рассматривать обращения покупателя: 80164420813, 80164471301</span><br>
        © 2006–2024 d4.by, ИП Шпак Сергей Сергеевич
    </div>
</div>
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


	$('.widget_curse').on('click', function(){
		$(this).toggleClass('activate');
	});
	$(document).mouseup(function (e) {
		var container = $(".widget_curse");
		if (container.has(e.target).length === 0){
			container.removeClass('activate');
		}
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