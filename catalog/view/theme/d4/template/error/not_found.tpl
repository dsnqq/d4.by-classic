<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="wrapper">
        <div class="left_wrapper">
      <?php echo $column_left; ?>
</div>
<div class="right_wrapper">
    <div id="content" >
    <section id="wrapper" style="text-align:center;display:flex;" class="container-fluid flex_404"><div><img src="/image/unnamed2.jpg" style="max-width:500px;width:100%;"></div><div class="error-box">            <div class="error-body text-center">                <h1 class="text-danger" style="color:#1C7ED6;">404</h1>                <h3>УПС... Кто-то успел купить запчасть раньше Вас.</h3>                <p class="text-muted m-t-30 m-b-30">ВРЕМЯ ОТ ВРЕМЕНИ ЭТО СЛУЧАЕТСЯ С КАЖДЫМ ИЗ НАС.<br>НАЖМИТЕ КНОПКУ НИЖЕ</p>                <a href="/" class="btn btn-danger btn-rounded m-b-40" style="color:#fff;background:#1C7ED6;border:1px solid #1C7ED6;    color: #fff;
    background: #1C7ED6;
    border: 1px solid #1C7ED6;
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    text-decoration: none;">Поиск запчастей</a> </div>                    </div>    </section><style>@import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700,900);body{font-family:Rubik,sans-serif;margin:0;overflow-x:hidden;font-weight:300}#wrapper{width:100%}error-box{height:100%;position:fixed;top:20%;width:100%}.error-box .footer{width:100%;left:0;right:0}.error-body h1{margin:0px auto;font-size:210px;font-weight:900;line-height:210px}.text-danger{color:#f33155}.text-muted{color:#8d9ea7}.m-b-40{margin-bottom:40px!important}.m-t-30{margin-top:30px!important}.m-b-30{margin-bottom:30px!important}@media only screen and (max-width: 520px){.error-body h1{font-size:110px;font-weight:700;line-height:110px}}</style>

   </div>
   </div>
</div>
</div>
      <?php echo $content_bottom; ?>
      <style>
      @media screen and (max-width: 991px) {
      .flex_404{flex-direction: column-reverse;grid-gap: 30px;}
      }
      </style>
<?php echo $footer; ?>
