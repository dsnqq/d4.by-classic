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
    <?php if(strpos($_SERVER['REQUEST_URI'], '?') !== false){ ?>
    <link href="https://d4.by<?php echo substr($_SERVER['REQUEST_URI'], 0, strpos($_SERVER['REQUEST_URI'], '?' )); ?>" rel="canonical" />
    <?php } else if(strpos($_SERVER['REQUEST_URI'], 'mfp') !== false) { ?>
        <link href="https://d4.by<?php echo substr($_SERVER['REQUEST_URI'], 0, strpos($_SERVER['REQUEST_URI'], 'mfp' )); ?>" rel="canonical" />
    <?php } else { ?>
        <link href="https://d4.by<?php echo $_SERVER['REQUEST_URI']; ?>" rel="canonical" />
    <?php }
    // die($_SERVER['REQUEST_URI']);
    ?>
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



<!-- new year ----
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
----new year end -->


    <header>
        <div class="header_top">
            <div class="container">
                <div class="header_top__flex">
                    <div class="header_bottom_flex_logo">
                        <a href="/">
                            <img src="/catalog/view/theme/d4/images/logo.svg">
                            <!---<img src="/catalog/view/theme/d4/images/logo-show.svg">--->
                        </a>
                    </div>
                    <div class="header_top_flex_info">
                        <a href="/kontakty#drogichen" class="header_top_flex_item" style="">
                            <address class="top_flex_item_text">Дрогичин, Заводская 20</address>
                            <div class="top_flex_item_text">ПН-СБ 9.00-18.00, ВС 10.00-13.00</div>
                        </a>
                        <a href="/kontakty#brest" class="header_top_flex_item">
                            <address class="top_flex_item_text">Брест, ул. Московская 364, пав.6 (Пункт выдачи)</address>
                            <div class="top_flex_item_text">ВТ-СБ 9.00-15.30, ВС 10.00 - 15.00, ПН-выходной</div>
                        </a>
                    </div>
                   <!---- <div class="header_top_flex_item currency_header">
                      <?php echo $currency; ?>
                      <img src="/catalog/view/theme/d4/images/polylang.svg" class="polylang__currency">
                    </div> --->
                    <div class="header_top_grid_contacts">
                        <div class="top_flex_item_text">
                            <a href="tel:+375298000736" style="color: #fff;text-decoration: none;">+375 (29) 800-07-36</a>
                            <div>
                                <a href="viber" style="text-decoration: none;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 25 25" fill="none">
                                        <circle cx="12.5" cy="12.5" r="12.5" fill="#7360F2"/>
                                        <path d="M17.009 7.78425C16.6943 7.49382 15.4223 6.57046 12.5892 6.55792C12.5892 6.55792 9.24813 6.35645 7.61943 7.85039C6.7128 8.75721 6.39386 10.0841 6.36022 11.7291C6.32658 13.3742 6.28305 16.4571 9.25479 17.293H9.25764L9.25574 18.5686C9.25574 18.5686 9.23673 19.085 9.57676 19.1903C9.98807 19.318 10.2295 18.9255 10.6221 18.5025C10.8377 18.2702 11.1353 17.929 11.3596 17.6682C13.392 17.8393 14.9552 17.4483 15.1327 17.3905C15.543 17.2575 17.8651 16.9598 18.2428 13.8773C18.6326 10.6999 18.0542 8.69012 17.009 7.78425ZM17.3535 13.6494C17.0347 16.2233 15.1513 16.3851 14.8041 16.4965C14.6564 16.544 13.2835 16.8855 11.5571 16.7728C11.5571 16.7728 10.2707 18.3247 9.8689 18.7283C9.80618 18.7914 9.73243 18.8168 9.6832 18.8043C9.61402 18.7874 9.59501 18.7054 9.59577 18.5857C9.59691 18.4146 9.60679 16.466 9.60679 16.466C9.60527 16.466 9.60679 16.466 9.60679 16.466C7.09294 15.7681 7.23948 13.1442 7.26799 11.7702C7.2965 10.3962 7.55462 9.27059 8.32136 8.51354C9.69898 7.26574 12.5369 7.4522 12.5369 7.4522C14.9335 7.46265 16.0819 8.18434 16.3482 8.42611C17.2324 9.18316 17.6828 10.9947 17.3535 13.6486V13.6494Z" fill="white"/>
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12.6374 10.6585C12.642 10.5701 12.7174 10.5022 12.8058 10.5068C13.1364 10.5241 13.4115 10.6241 13.6074 10.8267C13.8026 11.0285 13.8982 11.3104 13.915 11.649C13.9194 11.7373 13.8513 11.8125 13.7629 11.8169C13.6746 11.8213 13.5994 11.7532 13.595 11.6648C13.5806 11.375 13.5011 11.1777 13.3771 11.0495C13.2538 10.922 13.0657 10.8413 12.7891 10.8268C12.7007 10.8222 12.6328 10.7468 12.6374 10.6585Z" fill="white"/>
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12.3946 9.79551C12.4011 9.70726 12.4778 9.64095 12.5661 9.64741C13.239 9.69665 13.7805 9.92656 14.175 10.3572L14.1751 10.3572C14.5653 10.7836 14.7508 11.3141 14.7373 11.9362C14.7354 12.0247 14.6621 12.0949 14.5737 12.0929C14.4852 12.091 14.415 12.0178 14.4169 11.9293C14.4288 11.3806 14.2675 10.9328 13.9387 10.5736C13.6109 10.2158 13.1528 10.0117 12.5427 9.96701C12.4544 9.96055 12.3881 9.88377 12.3946 9.79551Z" fill="white"/>
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12.1118 8.97503C12.1124 8.88654 12.1847 8.81531 12.2732 8.81592C13.203 8.8224 13.989 9.13196 14.6201 9.74714C15.2564 10.3675 15.5711 11.212 15.5791 12.2608C15.5797 12.3493 15.5085 12.4216 15.4201 12.4223C15.3316 12.423 15.2593 12.3518 15.2586 12.2633C15.2511 11.2804 14.9587 10.5248 14.3964 9.9766C13.8287 9.42324 13.1239 9.14231 12.2709 9.13637C12.1824 9.13575 12.1112 9.06352 12.1118 8.97503Z" fill="white"/>
                                        <path d="M12.8292 13.8035C12.8292 13.8035 13.0545 13.8225 13.1757 13.6731L13.4122 13.3757C13.5262 13.2282 13.8014 13.1341 14.0709 13.2842C14.2729 13.3994 14.469 13.5247 14.6585 13.6594C14.8373 13.791 15.2036 14.0966 15.2047 14.0966C15.3792 14.2439 15.4195 14.4602 15.3007 14.6883C15.3007 14.6896 15.2997 14.6919 15.2997 14.693C15.1689 14.9199 15.0028 15.1244 14.8077 15.299C14.8054 15.3001 14.8054 15.3013 14.8033 15.3024C14.6337 15.4441 14.4672 15.5246 14.3036 15.544C14.2795 15.5482 14.255 15.5497 14.2306 15.5485C14.1585 15.5492 14.0867 15.5382 14.0181 15.5158L14.0128 15.5081C13.7608 15.437 13.3399 15.2591 12.6392 14.8725C12.2336 14.6514 11.8475 14.3963 11.4851 14.1101C11.3034 13.9667 11.1301 13.813 10.966 13.6497L10.9485 13.6323L10.931 13.6148L10.9135 13.5973C10.9076 13.5916 10.9019 13.5857 10.896 13.5798C10.7328 13.4157 10.5791 13.2424 10.4357 13.0607C10.1495 12.6983 9.89444 12.3123 9.67331 11.9068C9.28671 11.2058 9.1088 10.7854 9.03772 10.533L9.02993 10.5277C9.00764 10.4591 8.99667 10.3873 8.99742 10.3152C8.99609 10.2908 8.99756 10.2663 9.0018 10.2422C9.0222 10.0788 9.10285 9.91216 9.24375 9.74211C9.24489 9.74002 9.24603 9.74002 9.24717 9.73774C9.42172 9.54259 9.62627 9.37654 9.85312 9.24584C9.85426 9.24584 9.85654 9.2447 9.85787 9.2447C10.086 9.1259 10.3022 9.1662 10.4494 9.33973C10.4505 9.34087 10.7556 9.70714 10.8865 9.88599C11.0213 10.0756 11.1465 10.2719 11.2617 10.4741C11.4119 10.7434 11.3178 11.0192 11.1703 11.1328L10.8728 11.3693C10.7227 11.4906 10.7425 11.7158 10.7425 11.7158C10.7425 11.7158 11.183 13.3833 12.8292 13.8035Z" fill="white"/>
                                    </svg>
                                </a>
                                <a href="whatsapp" style="text-decoration: none;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 25 25" fill="none">
                                        <circle cx="12.5" cy="12.5" r="12.5" fill="#48C95F"/>
                                        <path d="M17.4543 7.53906C16.2195 6.30859 14.5732 5.625 12.8354 5.625C9.22256 5.625 6.29573 8.54167 6.29573 12.1419C6.29573 13.2812 6.61585 14.4206 7.16463 15.3776L6.25 18.75L9.72561 17.8385C10.686 18.3398 11.7378 18.6133 12.8354 18.6133C16.4482 18.6133 19.375 15.6966 19.375 12.0964C19.3293 10.4102 18.689 8.76953 17.4543 7.53906ZM15.9909 14.4661C15.8537 14.8307 15.2134 15.1953 14.8933 15.2409C14.6189 15.2865 14.253 15.2865 13.8872 15.1953C13.6585 15.1042 13.3384 15.013 12.9726 14.8307C11.3262 14.1471 10.2744 12.5065 10.1829 12.3698C10.0915 12.2786 9.49695 11.5039 9.49695 10.6836C9.49695 9.86328 9.90854 9.4987 10.0457 9.31641C10.1829 9.13411 10.3659 9.13411 10.503 9.13411C10.5945 9.13411 10.7317 9.13411 10.8232 9.13411C10.9146 9.13411 11.0518 9.08854 11.189 9.40755C11.3262 9.72656 11.6463 10.5469 11.6921 10.5924C11.7378 10.6836 11.7378 10.7747 11.6921 10.8659C11.6463 10.957 11.6006 11.0482 11.5091 11.1393C11.4177 11.2305 11.3262 11.3672 11.2805 11.4128C11.189 11.5039 11.0976 11.5951 11.189 11.7318C11.2805 11.9141 11.6006 12.4154 12.1037 12.8711C12.7439 13.418 13.247 13.6003 13.4299 13.6914C13.6128 13.7826 13.7043 13.737 13.7957 13.6458C13.8872 13.5547 14.2073 13.1901 14.2988 13.0078C14.3902 12.8255 14.5274 12.8711 14.6646 12.9167C14.8018 12.9622 15.625 13.3724 15.7622 13.4635C15.9451 13.5547 16.0366 13.6003 16.0823 13.6458C16.128 13.7826 16.128 14.1016 15.9909 14.4661Z" fill="white"/>
                                    </svg>
                                </a>
                                <a href="telegram" style="text-decoration: none;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 25 25" fill="none">
                                        <circle cx="12.5" cy="12.5" r="12.5" fill="#29B6F6"/>
                                        <path d="M5.84419 12.7338L8.718 13.8054L9.83829 17.4098C9.887 17.6534 10.1793 17.7021 10.3741 17.5559L11.9815 16.2408C12.1276 16.0947 12.3711 16.0947 12.566 16.2408L15.4398 18.3353C15.6346 18.4814 15.9269 18.384 15.9756 18.1404L18.1187 7.91166C18.1674 7.66812 17.9239 7.42458 17.6804 7.52199L5.84419 12.1006C5.55194 12.198 5.55194 12.6364 5.84419 12.7338ZM9.69217 13.2696L15.3423 9.81129C15.4398 9.76258 15.5372 9.90871 15.4398 9.95742L10.8125 14.2925C10.6663 14.4386 10.5202 14.6334 10.5202 14.877L10.3741 16.046C10.3741 16.1921 10.1305 16.2408 10.0818 16.046L9.49732 13.9028C9.3512 13.6593 9.44863 13.367 9.69217 13.2696Z" fill="white"/>
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <div class="top_flex_item_text"><a href="tel:+375297952640" style="color: #fff;text-decoration: none;">+375 (29) 795-26-40</a></div>
                        <div class="top_flex_item_text"><a href="tel:+375296416496" style="color: #fff;text-decoration: none;">+375 (29) 641-64-96</a></div>
                    </div>
                    <div class="header_top_flex_item">
                        <a href="/cart/" class="link_cub" style="font-size: 16px;border: 1px solid;">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M6 6C6 3.78947 4.21053 2 2 2C1.45614 2 1 2.45614 1 3C1 3.54386 1.45614 4 2 4C3.22807 4 4 4.77193 4 6C4 6.54386 4.45614 7 5 7C5.54386 7 6 6.54386 6 6ZM17.4035 7C18.807 7 19.614 7.98246 19.3684 9.36842L18.4737 14.3684C18.2807 15.4211 17.5789 16 16.4912 16H8C6.77193 16 6 15.2281 6 14V7H17.4035ZM17.4035 5H4V14C4 16.2105 5.78947 18 8 18H16.4912C18.4211 18 20.0877 16.614 20.4386 14.7193L21.3333 9.7193C21.7719 7.26316 19.9123 5 17.4035 5ZM17 19C15.8947 19 15 19.8947 15 21C15 22.1053 15.8947 23 17 23C18.1053 23 19 22.1053 19 21C19 19.8947 18.1053 19 17 19ZM7 19C5.89474 19 5 19.8947 5 21C5 22.1053 5.89474 23 7 23C8.10526 23 9 22.1053 9 21C9 19.8947 8.10526 19 7 19Z" fill="#fff"/>
                            </svg>
                            Корзина
                        </a>
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
                        </a>
                    </div>
                    <a href="/cart" class="qwerstyu" style="    display: block;
    border: 1px solid rgba(237, 247, 249, 0.2);
    box-sizing: border-box;
    box-shadow: 0px 5px 20px rgba(44, 61, 81, 0.1);
    border-radius: 50%;
    padding: 13px;
    margin-right: 20px;">
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
                    <div class="header_bottom_menu" style="width: 100%">
                        <?php if ($categories) { ?>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </header>

</body>
</html>