<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
    <script type="text/javascript" src="view/stylesheet/lightbox.min.js"></script>
    <link type="text/css" href="view/stylesheet/lightbox.min.css" rel="stylesheet" media="screen" />
    <div class="page-header">
        <div class="container-fluid">
            <h1>История пользователя: <?php echo $firstname; ?> <?php echo $lastname; ?></h1>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> Назад к списку пользователей</a>
            </div>
            <div class="panel-body">
                <div class="well" >
                    <div class="row">
                        <div class="col-sm-12">
                            <h2>Фильтр по истории пользователя</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="form-group">
                                <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                <input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="Введите артикул" id="input-name" class="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <br>
                            <button type="button" style="min-width: 200px;" id="button-filter" class="btn btn-primary pull-left"><i class="fa fa-filter"></i> <?php echo $button_filter; ?> Поиск</button>
                        </div>
                    </div>
                </div>
                <table class="historyTable1" style="width: 100%;border-collapse: collapse;">
                    <tr>
                        <td><strong>Изображение</strong></td>
                        <td><strong>Запчасть</strong></td>
                        <td><strong>Цена</strong></td>
                        <td><strong>Артикул</strong></td>
                        <td><strong>Что менялось/Действие</strong></td>
                        <td><strong>Дата изменения</strong></td>
                        <td><strong>Было</strong></td>
                        <td><strong>Стало</strong></td>
                        <td><strong>Местоположение текущее</strong></td>
                    </tr>
                    <?php //$changes = array_reverse($changes);?>
                    <?php foreach($changes as $item){ ?>
                        <tr>
                            <td>
                                <?php if($item['arhive_status']){ ?>
                                    <img src="<?php echo $item["arhive_image"]; ?>">
                                <?php } else{ ?>
                                    <img src="<?php echo $item["image"]; ?>">
                                <?php } ?>
                            </td>
                            <td>
                                <?php if($item['arhive_status']){ ?>
                                    <a href="/admin/index.php?route=catalog/arhive/edit&product_id=<?php echo $item["product_id"]; ?>&token=<?php echo $token_x; ?>">
                                        <?php echo $item['manufacturer_arhive']['name']; ?> к <?php echo $item["auto_arhive"]; ?>, <?php echo $item['year_arhive']; ?>г.
                                    </a>
                                <?php } elseif($item['manufacturer_product']['name'] && $item['manufacturer_product']['name'] != ''){ ?>
                                    <a href="/admin/index.php?route=catalog/product/edit&product_id=<?php echo $item["product_id"]; ?>&token=<?php echo $token_x; ?>">
                                        <?php echo $item['manufacturer_product']['name']; ?> к <?php echo $item["auto_product"]; ?>, <?php echo $item['year_product']; ?>г.
                                    </a>
                                <?php } else{ ?>
                                <?php } ?>
                            </td>
                            <td>
                                <?php
                                    $product = true;
                                 if($item["arhive_price"]) {
                                    echo $item["arhive_price"] . "$";
                                 }elseif($item["product_price"] && $item["product_price"] != ''){
                                    echo $item["product_price"] . "$";
                                   } else {
                                    $product = false;
                                   }
                                ?><br>
                                <?php
                                    if($item["arhive_price_byn"] !== "0р."){
                                        echo $item["arhive_price_byn"];
                                    } elseif($product){
                                        echo $item["product_price_byn"];
                                    }
                                ?>
                            </td>
                            <td><?php echo ($item["product_model"]) ? $item["product_model"] : $item["arhive_model"]; ?></td>
                            <td><?php echo $item["value_name"]; ?></td>
                            <td><?php echo $item["data_change"]; ?></td>
                            <td><?php echo $item["value_old"]; ?></td>
                            <td><?php echo $item["value_new"]; ?></td>
                            <td>
                                <?php if($item['arhive_status']){ ?>
                                    В архиве (Удалено)
                                <?php } elseif($product) { ?>
                                    В списке запчастей
                                <?php } else{ ?>
                                    Запчасть удалена слишком давно
                                <?php } ?>
                            </td>
                        </tr>
                    <?php } ?>
                </table>
                <?php if(!$_GET["filter_model"]){ ?>
                <div class="row" style="margin-top: 20px;">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>
<style>
    .historyTable tr,.historyTable td{border: 1px solid black;text-align:center;}
    .historyTable1 tr,.historyTable1 td{border: 1px solid black;text-align:center;}
    .historyTable td,.historyTable1 td {padding: 5px;}
    body {color:#000000;}
    body .historyTable1 {font-size:14px;}
</style>
<script type="text/javascript">

    $('#button-filter').on('click', function() {
        var url = 'index.php?route=user/history/edit&token=<?php echo $token_x; ?>&user_id=<?php echo $user_id_x; ?>';

        var filter_model = $('input[name=\'filter_model\']').val();

        if (filter_model) {
            url += '&filter_model=' + encodeURIComponent(filter_model);
        }

        location = url;
    });
</script>
<?php echo $footer; ?>