<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

		<link rel="icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
<link rel="icon" href="/favicon.png" type="image/png"/>	
<link rel="apple-touch-icon" href="/apple-touch-icon.png" />
<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png" />
<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png" />
<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png" />
<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png" />
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png" />
<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png" />
<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png" />
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png" />	
    <?php if($_SERVER['REQUEST_URI'] == "/katalog"){ ?>
        <title>Каталог автозапчастей - d4.by</title>
    <?php } else{ ?>
        <title><?php echo $title;  ?></title>
    <?php } ?>
    <base href="<?php echo $base; ?>" />
    <?php if($_SERVER['REQUEST_URI'] == "/katalog"){ ?>
        <meta name="description" content="В нашем каталоге б/у автозапчастей более 100тыс. запчастей. Возможна доставка." />
    <?php } else{ ?>
        <?php if ($description) { ?>
            <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content= "<?php echo $keywords; ?>" />
    <?php } ?>
    
    <?php /*foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php }*/ ?>
    <?php if(strpos($_SERVER['REQUEST_URI'], '?page=') !== false){ ?>
    <link href="https://d4.by<?php echo substr($_SERVER['REQUEST_URI'], 0, strpos($_SERVER['REQUEST_URI'], '?page' )); ?>" rel="canonical" />
    <?php } ?>
    <meta property="og:title" content="<?php echo $title; ?>" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="<?php echo $og_url; ?>" />
    <?php if ($og_image) { ?>
    <meta property="og:image" content="<?php echo $og_image; ?>" />
    <?php } else { ?>
    <meta property="og:image" content="<?php echo $logo; ?>" />
    <?php } ?>
    <meta property="og:site_name" content="<?php echo $name; ?>" />
		<meta property="twitter:card" content="summary_large_image">
	<meta property="twitter:url" content="<?php echo $og_url; ?>">
	<meta property="twitter:title" content="<?php echo $title; ?>">
	<meta property="twitter:description" content="<?php echo $description; ?>">
	<?php if ($og_image) { ?>
    <meta name="twitter:image:src" content="<?php echo $og_image; ?>">
    <?php } else { ?>
    <meta name="twitter:image:src" content="<?php echo $logo; ?>" />
    <?php } ?>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/catalog/view/theme/d4/js/main.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <link href="/catalog/view/theme/d4/css/style.css" rel="stylesheet" type="text/css">

    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>
    <style>
        .carousel_image_thumb .slick-slide img{
            width:100%;
        }
        </style>
	<script type="application/ld+json">{
    "@context": "http://schema.org",
    "@type": "LocalBusiness",
    "name": "D4.by",
    "image": "<?php echo $logo; ?>",
    "url": "https://d4.by/",
    "telephone": "+375 (29) 800-07-36",
    "address": {
        "@type": "PostalAddress",
        "streetAddress": "ул. Заводская д.20",
        "addressLocality": "г.Дрогичин",
        "postalCode": "225613",
        "addressCountry": "Беларусь",
        "addressRegion": "Брестская область"
    },
   
    "openingHours": [
        "пн-сб 9:00-18:00",
		"вс 9:00-13:00"
    ],
    "priceRange": "10-1000"
}</script>
	<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-WHCDK68');</script>
<!-- End Google Tag Manager -->
</head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-WHCDK68"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->


<?php /*
<!-- new year -->
<div class="b-page_newyear">
    <div class="b-page__content">
        <i class="b-head-decor">
            <i class="b-head-decor__inner b-head-decor__inner_n1">
                <div class="b-ball b-ball_n1 b-ball_bounce" data-note="0"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n2 b-ball_bounce" data-note="1"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n3 b-ball_bounce" data-note="2"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n4 b-ball_bounce" data-note="3"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n5 b-ball_bounce" data-note="4"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n6 b-ball_bounce" data-note="5"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n7 b-ball_bounce" data-note="6"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n8 b-ball_bounce" data-note="7"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n9 b-ball_bounce" data-note="8"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i1"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i2"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i3"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i4"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i5"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i6"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
            </i>
            <i class="b-head-decor__inner b-head-decor__inner_n2">
                <div class="b-ball b-ball_n1 b-ball_bounce" data-note="9"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n2 b-ball_bounce" data-note="10"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n3 b-ball_bounce" data-note="11"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n4 b-ball_bounce" data-note="12"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n5 b-ball_bounce" data-note="13"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n6 b-ball_bounce" data-note="14"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n7 b-ball_bounce" data-note="15"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n8 b-ball_bounce" data-note="16"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n9 b-ball_bounce" data-note="17"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i1"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i2"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i3"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i4"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i5"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i6"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
            </i>
            <i class="b-head-decor__inner b-head-decor__inner_n3">
                <div class="b-ball b-ball_n1 b-ball_bounce" data-note="18"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n2 b-ball_bounce" data-note="19"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n3 b-ball_bounce" data-note="20"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n4 b-ball_bounce" data-note="21"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n5 b-ball_bounce" data-note="22"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n6 b-ball_bounce" data-note="23"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n7 b-ball_bounce" data-note="24"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n8 b-ball_bounce" data-note="25"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n9 b-ball_bounce" data-note="26"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i1"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i2"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i3"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i4"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i5"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i6"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
            </i>
            <i class="b-head-decor__inner b-head-decor__inner_n4">
                <div class="b-ball b-ball_n1 b-ball_bounce" data-note="27"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n2 b-ball_bounce" data-note="28"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n3 b-ball_bounce" data-note="29"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n4 b-ball_bounce" data-note="30"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n5 b-ball_bounce" data-note="31"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n6 b-ball_bounce" data-note="32"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n7 b-ball_bounce" data-note="33"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n8 b-ball_bounce" data-note="34"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n9 b-ball_bounce" data-note="35"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i1"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i2"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i3"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i4"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i5"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i6"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
            </i>
            <i class="b-head-decor__inner b-head-decor__inner_n5">
                <div class="b-ball b-ball_n1 b-ball_bounce" data-note="0"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n2 b-ball_bounce" data-note="1"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n3 b-ball_bounce" data-note="2"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n4 b-ball_bounce" data-note="3"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n5 b-ball_bounce" data-note="4"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n6 b-ball_bounce" data-note="5"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n7 b-ball_bounce" data-note="6"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n8 b-ball_bounce" data-note="7"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n9 b-ball_bounce" data-note="8"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i1"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i2"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i3"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i4"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i5"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i6"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
            </i>
            <i class="b-head-decor__inner b-head-decor__inner_n6">
                <div class="b-ball b-ball_n1 b-ball_bounce" data-note="9"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n2 b-ball_bounce" data-note="10"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n3 b-ball_bounce" data-note="11"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n4 b-ball_bounce" data-note="12"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n5 b-ball_bounce" data-note="13"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n6 b-ball_bounce" data-note="14"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n7 b-ball_bounce" data-note="15"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n8 b-ball_bounce" data-note="16"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n9 b-ball_bounce" data-note="17"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i1"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i2"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i3"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i4"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i5"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i6"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
            </i>
            <i class="b-head-decor__inner b-head-decor__inner_n7">
                <div class="b-ball b-ball_n1 b-ball_bounce" data-note="18"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n2 b-ball_bounce" data-note="19"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n3 b-ball_bounce" data-note="20"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n4 b-ball_bounce" data-note="21"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n5 b-ball_bounce" data-note="22"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n6 b-ball_bounce" data-note="23"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n7 b-ball_bounce" data-note="24"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n8 b-ball_bounce" data-note="25"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_n9 b-ball_bounce" data-note="26"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i1"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i2"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i3"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i4"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i5"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
                <div class="b-ball b-ball_i6"><div class="b-ball__right"></div><div class="b-ball__i"></div></div>
            </i>
        </i>
    </div>
</div>
<link rel="stylesheet" href="newyear/style.css">
<script src="newyear/script.js" defer></script>
<!-- new year end -->
*/?>
    <header>
        <div class="header_top">
            <div class="container">
                <div class="header_top__flex">
                    <div class="header_top_flex_item">
                        <address class="top_flex_item_text">г.Дрогичин, Заводская 20</address>
                        <div class="top_flex_item_text">info@d4.by</div>
                        <div class="top_flex_item_text">+375 (29) 800-07-36, <!---+375 (29) 795-36-19--->+375 (29) 641-64-96</div>
                    </div>
                   <!---- <div class="header_top_flex_item currency_header">
                      <?php echo $currency; ?>
                      <img src="/catalog/view/theme/d4/images/polylang.svg" class="polylang__currency">
                    </div> --->
                    <div class="top_flex_item_text">
                    Время работы: Пн-Сб: 9.00-18.00, Вск: 10.00-13.00
                    </div>
                    <div class="header_top_flex_item">
                        <a href="/cart/" class="link_cub" style="font-size: 18px;border-bottom: 1px solid;"><img src="/catalog/view/theme/d4/images/cart_icon.svg" width="20px"> Корзина</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="header_bottom">
            <div class="container">
                <div class="header_bottom__flex">
                    <div class="header_bottom_flex_logo">
                        <a href="/">
                            <img src="/catalog/view/theme/d4/images/logo.svg">
                            <div class="logo_text_bottom">Автозапчасти б/у из Европы</div>
                        </a>
                    </div>
                    <a href="/cart" class="qwerstyu" style="    display: block;
    border: 1px solid rgba(237, 247, 249, 0.2);
    box-sizing: border-box;
    box-shadow: 0px 5px 20px rgba(44, 61, 81, 0.1);
    border-radius: 4px;
    padding: 13px;
    margin-right: 10px;">
                    <svg style="display:block;" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g clip-path="url(#clip0)">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M7 21.0001C7 19.8955 7.89543 19.0001 9 19.0001C10.1046 19.0001 11 19.8955 11 21.0001C11 22.1046 10.1046 23.0001 9 23.0001C7.89543 23.0001 7 22.1046 7 21.0001Z" fill="#EEF2F5"/>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M18 21.0001C18 19.8955 18.8954 19.0001 20 19.0001C21.1046 19.0001 22 19.8955 22 21.0001C22 22.1046 21.1046 23.0001 20 23.0001C18.8954 23.0001 18 22.1046 18 21.0001Z" fill="#EEF2F5"/>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M0 1.00006C0 0.447776 0.447715 6.10352e-05 1 6.10352e-05H5C5.47663 6.10352e-05 5.88701 0.336446 5.98055 0.803804L6.82043 5.00006H23C23.298 5.00006 23.5805 5.13299 23.7705 5.36262C23.9605 5.59224 24.0381 5.89464 23.9823 6.18739L22.3809 14.5849C22.2437 15.2755 21.868 15.8958 21.3195 16.3373C20.7738 16.7766 20.0916 17.011 19.3914 17.0001H9.68864C8.98837 17.011 8.3062 16.7766 7.76048 16.3373C7.21225 15.896 6.83664 15.276 6.69933 14.5857C6.69927 14.5854 6.69939 14.586 6.69933 14.5857L5.02879 6.23926C5.02201 6.21165 5.01638 6.18359 5.01195 6.15514L4.18032 2.00006H1C0.447715 2.00006 0 1.55235 0 1.00006ZM7.22073 7.00006L8.66084 14.1952C8.70656 14.4254 8.83179 14.6322 9.01461 14.7794C9.19743 14.9266 9.42619 15.0047 9.66084 15.0002L9.68 15.0001H19.4L19.4192 15.0002C19.6538 15.0047 19.8826 14.9266 20.0654 14.7794C20.2474 14.6329 20.3723 14.4274 20.4185 14.1985L21.7913 7.00006H7.22073Z" fill="#EEF2F5"/>
                        </g>
                        <defs>
                        <clipPath id="clip0">
                        <rect width="24" height="24" fill="white"/>
                        </clipPath>
                        </defs>
                        </svg>
                    </a>
                    <div class="burg">
                        <img src="/catalog/view/theme/d4/images/burg.svg">
                    </div>
                    <div class="header_bottom_menu">
                        <?php if ($categories) { ?>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </header>

</body>
</html>