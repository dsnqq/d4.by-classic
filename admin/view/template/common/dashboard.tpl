<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1>Личный кабинет</h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li>
          <a href="<?php echo $breadcrumb['href']; ?>">
            <?php echo $breadcrumb['text']; ?>
          </a>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <style>
    .action.pencil {
      display: none !important;
    }

    .content {
      padding: 15px 10px 3px;
    }

    .lk_left {
      width: 50%;
      float: left;
    }

    .lk_right {
      width: 50%;
      float: left;
      padding-left: 50px;
    }

    .clear {
      clear: both;
    }

    .table {
      width: 100%;
      max-width: 100%;
      margin-bottom: 20px;
    }

    .pencil-valute {
      cursor: pointer;
    }
  </style>
  <div class="container-fluid">
    <div class="content">
      <div class="lk_left">
        <div class="bx-system-auth-form">
          <table class="table control-form">
            <tbody>
            <tr>
              <td>Действия</td>
              <td width="65%">
                <div>
                  <a href="<?=$link_logout?>" class="btn btn-default btn-xs"><i class="fa fa-sign-out" aria-hidden="true"></i>  Выход</a>
                  <br><a class="btn btn-default btn-xs" style="margin-top: 5px;" href="https://d4.by" target="_blank"><i style="font-size: 11px;" class="fa fa-home fa-lg"></i> Посмотреть мой сайт</a>
                </div>
              </td>
            </tr>
            <tr>
              <td>Количество объявлений запчастей</td>
              <td>
                всего <b><?=$productCount?></b> шт
                <span class="gray">(<b><?php echo $activeProduct = (int)$productCount - (int)$productCountNo; ?></b> активных и <b><?=$productCountNo?></b> неактивных)</span>
              </td>
            </tr>
            <tr>
              <td>Количество объявлений шин</td>
              <td>
                всего <b><?=$shinyCount?></b> шт
                <span class="gray">(<b><?php echo $activeShiny = (int)$shinyCount - (int)$shinyCountNo; ?></b> активных и <b><?=$shinyCountNo?></b> неактивных)</span>
              </td>
            </tr>
            <tr>
              <td>Неудачные покупки</td>
              <td>
                <a target="_blank" class="btn btn-default btn-xs abtn" href="<?=$cart_shopper?>"> <i class="fa fa-shopping-cart "></i> Посмотреть</a>
              </td>
            </tr>
            <tr>
              <td>bumper.by </td>
              <td>
                <a target="_blank" class="btn btn-default btn-xs abtn" href="https://bamper.by/personal/"> <i style="font-size: 11px;" class="fa fa-home fa-lg"></i> Личный кабинет</a>
              </td>
            </tr>
            <tr>
              <td>Показать статистику </td>
              <td>
                <a class="btn btn-default btn-xs abtn" href="<?=$link_statistics?>"> <i class="fa fa-shopping-cart "></i> Что хотели купить у нас</a>
              </td>
            </tr>
            <?php if($user_id_com != 4){ ?>
            <tr>
              <td>Валюты</td>
              <td>
                <ul class="lk-li">
                  <li><a href="<?=$setting_valute?>">Список валют</a></li>
                  <li><a href="<?=$setting_valute_te?>">Настройка процента от НБРБ</a></li>
                </ul>
                <table style="width: 100%;max-width: 300px;">
                  <tbody>
                  <tr data-valute="USD" data-id="1">
                    <td>Доллар США (USD):</td>
                    <td>
                      <input disabled="" type="text" value="<?php echo round($currencies['BYN']['value'], 2); ?>" style="width: 100px;">
                    </td>
                    <td class="pencil-valute"><i aria-hidden="true" class="fa fa-pencil-square-o"></i></td>
                  </tr>
                  <tr data-valute="EUR" data-id="3">
                    <td>Евро (EUR):</td>
                    <td>
                      <input disabled="" type="text" value="<?php echo round($currencies['EUR']['value'], 2); ?>" style="width: 100px;">
                    </td>
                    <td class="pencil-valute"><i aria-hidden="true" class="fa fa-pencil-square-o"></i></td>
                  </tr>
                  <tr data-valute="RUB" data-id="4">
                    <td>Рос. рубль (RUB):</td>
                    <td>
                      <input disabled="" type="text" value="<?php echo round($currencies['RUB']['value'], 2); ?>" style="width: 100px;">
                    </td>
                    <td class="pencil-valute"><i aria-hidden="true" class="fa fa-pencil-square-o"></i></td>
                  </tr>
                  </tbody>
                </table>
              </td>
            </tr>
            <tr>
              <td>Настройки d4.by</td>
              <td>
                <a class="btn btn-default btn-xs abtn" href="<?=$setting_setting?>"> <i style="font-size:11px;" class="fa fa-bell fa-lg"></i> Перейти к настройкам</a>
              </td>
            </tr>
            <?php } ?>
            <tr>
              <td>Запчасти <span title="активных/неактивных">(<?=$activeProduct?>/<?=$productCountNo?>)</span></td>
              <td>
                <a class="btn btn-success btn-sm abtn" href="<?=$link_zch_add?>"><i class="fa fa-plus-circle" aria-hidden="true"></i> Добавить объявление</a>
                <a class="btn btn-warning btn-sm abtn" href="<?=$link_zch?>"><i class="fa fa-list-ol" aria-hidden="true"></i> Показать наши з/ч</a>
              </td>
            </tr>
            <tr>
              <td>Шины <span title="активных/неактивных">(<?php echo $activeShiny = (int)$shinyCount - (int)$shinyCountNo; ?>/<?=$shinyCountNo?>)</span></td>
              <td>
                <a class="btn btn-success btn-sm abtn" href="<?=$link_shiny_add?>"><i class="fa fa-plus-circle" aria-hidden="true"></i>  Добавить объявление</a>
                <a class="btn btn-warning btn-sm abtn" href="<?=$link_shiny?>"><i class="fa fa-list-ol" aria-hidden="true"></i> Показать наши шины</a>
              </td>
            </tr>
            <?php if($user_id_com != 4){ ?>
            <tr>
              <td>Доп.информация</td>
              <td>
                <ul class="lk-li">
                  <li><a href="https://d4.by/bamper/csv_for_bamper.csv">Последняя выгрузка на bamper.by (з/ч)</a></li>
                  <li><a href="https://d4.by/bamper/csv_for_bamper_shiny.csv">Последняя выгрузка на bamper.by (шины)</a></li>
                  <li><a href="<?=$link_zch_name?>">Cписок марок и моделей автомобилей</a></li>
                  <li><a href="<?=$link_modification?>">Список всех модицикаций для фильтра</a></li>
                  <li><a href="<?=$link_auto?>">Список всех марок и моделей</a></li>
                </ul>
              </td>
            </tr>
            <?php } ?>
            <tr>
              <td>Действия</td>
              <td>
                <a href="https://d4.by/admin/index.php?route=catalog/product/deletedAllNoActive&token=<?php echo $token; ?>" class="btn btn-danger deleteAllNoActiveZh">Удалить все неактивные З/Ч</a>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="lk_right">
        <?php /* lenta */ ?>
      </div>
      <div class="clear"></div>
      <?php if (isset($manager_status) && $manager_status) { ?>
      <?php if (isset($manager_success) && $manager_success) { ?>
      <div class="alert alert-success"><i class="fa fa-check-circle"></i>
        <?php echo $manager_success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <?php if (isset($manager_error) && $manager_error) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
        <?php echo $manager_error; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>
      <?php } ?>
      <?php if (isset($manager_status) && $manager_status) { ?>
      <?php echo $manager; ?>
      <?php } ?>
    </div>
  </div>
</div>

<script>
  $('.pencil-valute').on('click', function(){
    let el = $(this);

    if(el.hasClass('active')){
      el.removeClass('active');
      el.find('.fa').removeClass('fa-save').addClass('fa-pencil-square-o');
      el.prev().find('input').attr('disabled','disabled');

      var selectedItem =  el.prev().find('input').val(); //здесь получаем число
      var selectedItemId = el.parent().data('id'); //здесь получаем ID валюты

      $.ajax({
        url: 'index.php?route=localisation/currency/editer&token=<?php echo $token; ?>&curid='+selectedItemId+'&curvalue='+selectedItem,
        dataType: 'html',
        data: {
          "curvalue" : selectedItem,
          "curid" : selectedItemId
        },
        cache: false,
        method: 'POST',
        success: function(html) {
          console.log(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    }else{
      el.addClass('active');
      el.find('.fa').removeClass('fa-pencil-square-o').addClass('fa-save');
      el.prev().find('input').removeAttr('disabled');
    }
  });

  $('.deleteAllNoActiveZh').on('click', function(){
    return confirm("Вы действительно хотите удалить неактивные З/Ч ?");
  });
</script>
<?php echo $footer; ?>
