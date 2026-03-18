<?php echo $header; ?>

<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <h1>Проданные запчасти</h1>
        </div>
    </div>

    <div class="container-fluid">

        <!-- СТАТИСТИКА -->
        <div class="stats-box" style="background:#e9f7fe;padding:10px 15px;border-radius:5px;margin-bottom:20px;border-left:4px solid #17a2b8;">
            <h4>Статистика продаж</h4>
            <div class="row">
                <div class="col-md-3">
                    <strong>Всего продано:</strong>
                    <span class="badge badge-danger"><?php echo $stats_total; ?></span>
                </div>
                <div class="col-md-3">
                    <strong>За сегодня:</strong>
                    <span class="badge badge-warning"><?php echo $stats_today; ?></span>
                </div>
                <div class="col-md-3">
                    <strong>За неделю:</strong>
                    <span class="badge badge-info"><?php echo $stats_week; ?></span>
                </div>
                <div class="col-md-3">
                    <strong>За месяц:</strong>
                    <span class="badge badge-primary"><?php echo $stats_month; ?></span>
                </div>
            </div>
        </div>

        <!-- ФИЛЬТР -->
        <div class="panel panel-default">
            <div class="panel-body">
                <form method="get" class="form-inline">

                    <input type="hidden" name="route" value="accounting/product_accounting">
                    <input type="hidden" name="token" value="<?php echo $token; ?>">

                    <div class="form-group">
                        <label>Дата с</label>
                        <input type="text" name="date_from" value="<?php echo $date_from; ?>" class="form-control date">
                    </div>

                    <div class="form-group" style="margin-left:10px;">
                        <label>по</label>
                        <input type="text" name="date_to" value="<?php echo $date_to; ?>" class="form-control date">
                    </div>

                    <button type="submit" class="btn btn-primary" style="margin-left:10px;">
                        <i class="fa fa-filter"></i> Фильтр
                    </button>

                    <a href="index.php?route=accounting/product_accounting&token=<?php echo $token; ?>"
                       class="btn btn-default" style="margin-left:5px;">
                        <i class="fa fa-refresh"></i> Сброс
                    </a>
                </form>
            </div>
        </div>

        <!-- ТАБЛИЦА -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <i class="fa fa-list"></i> Список проданных запчастей
                </h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-sm" id="export-csv">
                        <i class="fa fa-download"></i> Экспорт в CSV
                    </button>
                </div>
            </div>

            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th style="width:90px;">ID (в базе)</th>
                            <th>Наименование</th>
                            <th>Артикул</th>
                            <th>Цена (USD)</th>
                            <th>Цена (BYN)</th>
                            <th>Дата продажи</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if ($sales) { ?>
                        <?php foreach ($sales as $sale) { ?>
                        <tr>
                            <td><?php echo $sale['id']; ?></td>
                            <td><strong><?php echo $sale['product_name']; ?></strong></td>
                            <td><?php echo $sale['model']; ?></td>
                            <td><?php echo $sale['price']; ?></td>
                            <td><?php echo $sale['price_byn']; ?></td>
                            <td><?php echo $sale['sold_at']; ?></td>
                        </tr>
                        <?php } ?>
                        <?php } else { ?>
                        <tr>
                            <td colspan="5" class="text-center">Нет данных</td>
                        </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>

                <!-- ПАГИНАЦИЯ -->
                <div class="row">
                    <div class="col-sm-6 text-left">
                        <?php echo $pagination; ?>
                    </div>
                    <div class="col-sm-6 text-right">
                        <?php echo $results; ?>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('.date').datetimepicker({
        pickTime: false,
        format: 'YYYY-MM-DD'
    });
</script>
<script type="text/javascript">
    $('#export-csv').on('click', function () {
        let date_from = $('input[name="date_from"]').val();
        let date_to   = $('input[name="date_to"]').val();

        let url = 'index.php?route=accounting/product_accounting/exportCsv'
            + '&token=<?php echo $token; ?>';

        if (date_from) {
            url += '&date_from=' + encodeURIComponent(date_from);
        }

        if (date_to) {
            url += '&date_to=' + encodeURIComponent(date_to);
        }

        window.location.href = url;
    });
</script>


<?php echo $footer; ?>
