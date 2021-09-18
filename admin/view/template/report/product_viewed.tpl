<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
        <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <?php 
          echo '
            <div style="display:flex;justify-content:space-between;align-items:center;border-bottom: 2px solid;">
              <div class="">Всего просмотренно: '.$product_total.' шт.</div>
              <div style=";font-size:18px;color:red;">Самые свежие просмотры добавляются вверх</div>
              <div class="">Сегодня '.date('d.m.Y').'<br><a style="display: block;color: #fff;background: #000;padding: 5px 10px;border-radius: 3px;margin: 5px 0px;" href="'.$_SERVER['REQUEST_URI'].'">ОБНОВИТЬ СТАТИСТИКУ</a></div>
            </div>
          ';
          echo '<table class="table">';
              echo '<tr>';
                echo '<td>№</td>';
                echo '<td>Дата</td>';
                echo '<td>Название</td>';
                echo '<td>Артикул</td>';
                echo '<td>Статус З/Ч</td>';
                echo '<td>Кол-во просмотров</td>';
                echo '<td></td>';
              echo '</tr>';
            foreach($product_view_all as $product_view_item){
              if($product_view_item['status'] == 1){
                $status_zch = 'Активно';
              } elseif($product_view_item['status'] == 0){
                $status_zch = 'Неактивно';
              } 
              if (!$product_view_item['article']){
                $status_zch = 'Продана';
                $product_view_item['article'] = '-';
              }
              echo '<tr>';
                echo '<td>'.$product_view_item['num'].'</td>';
                echo '<td>'.$product_view_item['date'].'</td>';
                echo '<td><a target="_blank" style="margin: 0px 5px;" href="'.$product_view_item['linkSite'].'">'.$product_view_item['name'].'</a></td>';
                echo '<td>'.$product_view_item['article'].'</td>';
                echo '<td>'.$status_zch.'</td>';
                echo '<td>'.$product_view_item['countView'].'</td>';
                echo '<td>
                  <a target="_blank" style="margin: 0px 5px;" href="'.$product_view_item['linkSite'].'"><i class="fa fa-eye"></i></a>
                  <a style="margin: 0px 0px;" href="'.$product_view_item['linkEdit'].'"><i class="fa fa-pencil"></i></a>
                  <a class="deletedButton" style="margin: 0px 0px 0px 20px;" href="'.$product_view_item['linkDeleted'].'"><i class="fa fa-trash-o"></i></a>
                </td>';
              echo '</tr>';
            }
          echo '</table>';
        ?>
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        <div class="row">
          <div class="col-sm-12">
            <div style="border-top:3px solid #ddd;margin-top:25px;padding-top:25px;"></div>
              <div style="text-align:center;font-size:18px;color:red;">Статистика по датам</div>
              <?php 
                 echo '<table class="table">';
                 echo '<tr>';
                   echo '<td style="padding: 5px !important;">Дата</td>';
                   echo '<td style="padding: 5px !important;">Количество просмотров</td>';
                 echo '</tr>';
              ?>
              <?php foreach($countAllArray as $countAllArray__item => $key){ ?>
                <tr><td style="padding: 5px !important;"><?=$countAllArray__item?></td><td style="padding: 5px !important;"><?php echo count($key); ?> шт.</td></tr>
              <?php } ?>
              <?php 
                 echo '</table>';

              ?>
          </div>
        </div>
      </div><!---->
    </div>
  </div>
</div>
<style>
  body{
    color:#000;
  }
  td{
    padding:0px !important;
  }
  .table a{
    color:inherit;
  }
  .table tr:not(:first-child):hover{
    background: #eee;
  }
  .table tr td:nth-child(n+4){
    text-align: center;
  }
  .table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td{ 
    border-right: 1px solid #ddd;
  }
  </style>
  <script>
    $(document).ready(function() {
      $(".deletedButton").on("click", function () {
        return confirm("Вы действительно хотите удалить З/Ч ?");
      });
    });

  </script>
<?php echo $footer; ?>