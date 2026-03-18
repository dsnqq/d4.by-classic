<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <h1>
                <?php echo $heading_title; ?>
            </h1>
        </div>
    </div><!---
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading"><h3 class="panel-title">График просмотров по годам и месяцам</h3></div>
                    <div class="panel-body">
                        <canvas id="statisticsChart" style="width:100%; height:400px;"></canvas>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Сегодня просмотрено: <?php echo $today_stats_total; ?> Последние 30 (новые вверху)</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th>№</th>
                                <th>Дата и Время</th>
                                <th>Название</th>
                                <th>Артикул</th>
                                <th>Статус</th>
                                <th>Кол-во просмотров</th>
                                <th>Ссылки</th>
                            </tr>
                            <?php foreach ($today_stats as $pid => $item) { ?>
                            <tr>
                                <td><?php echo $item['num']; ?></td>
                                <td><?php echo $item['date']; ?></td>
                                <td>
                                    <a target="_blank" href="<?php echo $item['linkEdit']; ?>">
                                        <?php echo $item['name']; ?>
                                    </a>
                                </td>
                                <td><?php echo $item['model']; ?></td>
                                <td><?php echo $item['status']; ?></td>
                                <td><?php echo $item['count']; ?></td>
                                <td>
                                    <a target="_blank" href="<?php echo $item['linkSite']; ?>" style="margin-right: 5px;"><i class="fa fa-eye"></i></a>
                                    <a target="_blank" href="<?php echo $item['linkEdit']; ?>" style="margin-right: 5px;"><i class="fa fa-pencil"></i></a>
                                </td>
                            </tr>
                            <?php } ?>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>--->
    <div class="container-fluid">
        <div class="row">
            <!-- Основная таблица (2/3 ширины) -->
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-heading"><h3 class="panel-title">Общая статистика (обновляется раз в сутки)</h3></div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>№</th>
                                <th>Дата и Время</th>
                                <th>Название</th>
                                <th>Артикул</th>
                                <th>Статус</th>
                                <th>Кол-во просмотров</th>
                                <th>Ссылки</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($products as $product) { ?>
                            <tr>
                                <td><?php echo $product['num']; ?></td>
                                <td>
                                    <?php
                                        $last_index = count($product['date']) - 1;
                                        echo date('Y-m-d H:i:s', strtotime("+3 hours", $product['date'][$last_index]));
                                    ?>
                                    <?php if(count($product['date']) > 2){ ?>
                                        <span class="viewsDataAndTime" data-views="<?php echo implode(',', $product['date'])?>" data-toggle="tooltip" title data-original-title="Все просмотры">
                                            <i class="fa fa-eye"></i>
                                        </span>
                                    <?php } ?>
                                </td>
                                <td>
                                    <a target="_blank" href="<?php echo $item['linkEdit']; ?>">
                                        <?php echo $product['name']; ?>
                                    </a>
                                </td>
                                <td><?php echo $product['article']; ?></td>
                                <td><?php echo $product['status']; ?></td>
                                <td><?php echo $product['countView']; ?></td>
                                <td>
                                    <a target="_blank" href="<?php echo $product['linkSite']; ?>" style="margin-right: 5px;"><i class="fa fa-eye"></i></a>
                                    <a target="_blank" href="<?php echo $product['linkEdit']; ?>" style="margin-right: 5px;"><i class="fa fa-pencil"></i></a>
                                </td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>

                        <div class="text-center"><?php echo $pagination; ?></div>
                    </div>
                </div>
            </div>

            <!-- Боковая статистика (1/3 ширины) -->
            <div class="col-md-4">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Статистика за 5 последних дней</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>День</th>
                                <th>Просмотры</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($statistics_by_days as $day => $count) { ?>
                            <tr>
                                <td><?php echo $day; ?></td>
                                <td><?php echo $count; ?></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <?php foreach ($statistics_by_years as $year => $data) { ?>
                    <?php if($year >= '2000') { ?>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Статистика за <?php echo $year; ?> (Всего: <?php echo $data['total']; ?>)</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-bordered table-hover table-condensed">
                                    <thead>
                                    <tr>
                                        <th>Месяц</th>
                                        <th>Просмотры</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php foreach ($data['months'] as $month => $count) { ?>
                                    <tr>
                                        <td><?php echo $month; ?></td>
                                        <td><?php echo $count; ?></td>
                                    </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    <?php } ?>
                <?php } ?>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="viewsModal" tabindex="-1" role="dialog" aria-labelledby="viewsModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Закрыть"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="viewsModalLabel">Все просмотры</h4>
            </div>
            <div class="modal-body" id="viewsModalBody"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
            </div>
        </div>
    </div>
</div>

<script src="view/javascript/chart.js"></script>

<script>
    var statistics = <?php echo json_encode($statistics_by_years); ?>;

    var allData = [];

    for (var year in statistics) {
        if (statistics.hasOwnProperty(year)) {
            if (parseInt(year) < 2000) continue;

            var months = statistics[year]['months'];
            for (var month in months) {
                if (months.hasOwnProperty(month)) {
                    allData.push({
                        label: year + '-' + month,
                        value: months[month],
                        year: parseInt(year),
                        month: parseInt(month)
                    });
                }
            }
        }
    }

    // Сортируем по году и месяцу
    allData.sort(function(a, b) {
        if (a.year === b.year) {
            return a.month - b.month;
        }
        return a.year - b.year;
    });

    // Разделяем на labels и data
    var labels = [];
    var data = [];

    allData.forEach(function(item) {
        labels.push(item.label);
        data.push(item.value);
    });

    var ctx = document.getElementById('statisticsChart').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Просмотры',
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1,
                data: data
            }]
        },
        options: {
            responsive: true,
            scales: {
                x: {
                    ticks: {
                        autoSkip: false,
                        maxRotation: 90,
                        minRotation: 45
                    }
                },
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

<script>
    $(document).ready(function() {
        $('.viewsDataAndTime').click(function() {
            var dates = $(this).data('views').split(',');
            var formatted = dates.map(function(ts) {
                var date = new Date((parseInt(ts) + 3*3600) * 1000);
                return date.getFullYear() + '-' +
                    ('0'+(date.getMonth()+1)).slice(-2) + '-' +
                    ('0'+date.getDate()).slice(-2) + ' ' +
                    ('0'+date.getHours()).slice(-2) + ':' +
                    ('0'+date.getMinutes()).slice(-2) + ':' +
                    ('0'+date.getSeconds()).slice(-2);
            });
            $('#viewsModalBody').html(formatted.join('<br>'));
            $('#viewsModal').modal('show');
        });
    });
</script>

<?php echo $footer; ?>
