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
      .action.pencil{
        display:none !important;
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
                        <a target="_blank" class="btn btn-default btn-xs abtn" href="<?=$cart_shopper?>"> <i class="fa fa-shopping-cart "></i>  Посмотреть</a>
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
                    <tr>
                      <td>Валюты</td>
                      <td>
                        <ul class="lk-li">
                          <li><a href="<?=$setting_valute?>">Список валют</a></li>
                          <li><a href="<?=$setting_valute_te?>">Настройка процента от НБРБ</a></li>
                        </ul>
                        
                      </td>
                    </tr>
                    <tr>
                      <td>Настройки d4.by</td>
                      <td>
                        <a class="btn btn-default btn-xs abtn" href="<?=$setting_setting?>"> <i style="font-size:11px;" class="fa fa-bell fa-lg"></i> Перейти к настройкам</a>
                      </td>
                    </tr>
                    
                    <tr>
                      <td>Запчасти <span title="активных/неактивных">(<?=$activeProduct?>/<?=$productCountNo?>)</span></td>
                      <td>
                        <a class="btn btn-success btn-sm abtn" href="<?=$link_zch_add?>"><i class="fa fa-plus-circle" aria-hidden="true"></i> Добавить объявление</a>
                        <a class="btn btn-warning btn-sm abtn" href="<?=$link_zch?>"><i class="fa fa-list-ol" aria-hidden="true"></i> Показать наши з/ч</a>
                        <?php /*<a class="btn btn-default btn-xs abtn" href="/personal/import/"><i class="fa fa-download" aria-hidden="true"></i> Импорт Excel Сайт</a>
                        <a class="btn btn-default btn-xs abtn" href="/personal/export/"><i class="fa fa-upload" aria-hidden="true"></i> Экспорт Сайт Excel</a>*/ ?>
                      </td>
                    </tr>

                    <tr>
                      <td>Шины <span title="активных/неактивных">(<?php echo $activeShiny = (int)$shinyCount - (int)$shinyCountNo; ?>/<?=$shinyCountNo?>)</span></td>
                      <td>
                        <a class="btn btn-success btn-sm abtn" href="<?=$link_shiny_add?>"><i class="fa fa-plus-circle" aria-hidden="true"></i>  Добавить объявление</a>
                        <a class="btn btn-warning btn-sm abtn" href="<?=$link_shiny?>"><i class="fa fa-list-ol" aria-hidden="true"></i> Показать наши шины</a>
                      </td>
                    </tr>
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
                  </tbody>
                </table>
            </div>
          </div>
          <div class="lk_right"><!---
            <h4 style="font-weight:bold;">Что делается и сделано по сайту с 01.03.21</h4>
            <a target="_blank" class="btn btn-warning btn-sm abtn" href="https://docs.google.com/spreadsheets/d/1nwpMFXGY8uX-5_kVTreBBWqrawgbB8qn0O4h2eZZhSQ/edit?usp=sharing"><i class="fa fa-check-circle" aria-hidden="true"></i>Смотреть excel онлайн</a>
-->
<h4 style="font-weight:bold;margin-top:10px;">Добавлены новые наименования запчастей 20.09.21</h4>
- Горелка автономного отопителя<br>
- Датчик температуры автономного отопителя<br>
- Датчик пламени автономного отопителя<br>
- Карданный вал передний<br>
- Крепление ковриков салона<br>
- Кронштейн датчика положения кузова<br>
- Направляющая задней распашной двери<br>
- Радиатор гидроподвески<br>
- Ротор генератора<br>
- Тяга датчика положения кузова<br>
<!--- CONTENT  -->
          </div>
          <div class="clear"></div>
          
          <?php if (isset($manager_status) && $manager_status) { ?>
              <?php if (isset($manager_success) && $manager_success) { ?>
                  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $manager_success; ?>
                      <button type="button" class="close" data-dismiss="alert">&times;</button>
                  </div>
                <?php } ?>
              
              <?php if (isset($manager_error) && $manager_error) { ?>
                  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $manager_error; ?>
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
    <?php echo $footer; ?>