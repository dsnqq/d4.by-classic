<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">

    <link rel="stylesheet" href="/admin/view/javascript/lightbox.css" />
    <script src="/admin/view/javascript/lightbox.min.js"></script>

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
        <div class="">
            <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <td>Фото</td>
                            <td>Марка</td>
                            <td>Модель</td>
                            <td>VIN</td>
                            <td>Страна эксплуатации</td>
                            <td>Год</td>
                            <td>Тип двигателя</td>
                            <td>Объем двигателя</td>
                            <td>Маркировка двигателя</td>
                            <td>Особенности двигателя</td>
                            <td>Кузов</td>
                            <td>Цвет</td>
                            <td>Действие</td>
                        </tr>
                        </thead>
                        <tbody>

                        <?php /* FILTER PLACE */ ?>

                        <?php if ($products) { ?>
                            <?php foreach ($products as $product) { ?>
                                <tr>
                                    <td>
                                        <?php foreach($product['images'] as $image){ ?>
                                            <img src="<?php echo $image; ?>">
                                        <?php } ?>
                                    </td>
                                    <td> <?php echo $product['marka']; ?></td>
                                    <td> <?php echo $product['model']; ?></td>
                                    <td> <?php echo $product['vin']; ?></td>
                                    <td> <?php echo $product['country']; ?></td>
                                    <td> <?php echo $product['year']; ?></td>
                                    <td> <?php echo $product['typePower']; ?></td>
                                    <td> <?php echo $product['volume']; ?></td>
                                    <td> <?php echo $product['power']; ?></td>
                                    <td> <?php echo $product['aboutPower']; ?></td>
                                    <td> <?php echo $product['body']; ?></td>
                                    <td> <?php echo $product['color']; ?></td>
                                    <td class="text-center">
                                        <a href="<?php echo $product['restore']; ?>" class="btn btn-default restoreButton">
                                            Восстановить
                                        </a>
                                        <br>
                                        Дата удаления:<br>
                                        <?php echo $product['date_delete']; ?>
                                    </td>
                                </tr>
                            <?php } ?>
                        <?php } else { ?>
                            <tr>
                                <td class="text-center" colspan="13"><?php echo $text_no_results; ?></td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </form>
            <div class="row">
                <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
        </div>
    </div>
</div>

<?php /* javascript for bootstrap select */ ?>
<script src="view/javascript/bootstrap-select.min.js"></script>
<script src="view/javascript/jquery.chained.js"></script>

<!-- HTML-код модального окна -->
<div id="myModalBoxHistory" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Заголовок модального окна -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">История запчасти</h4>
            </div>
            <!-- Основное содержимое модального окна -->
            <div class="modal-body">
                <table class="historyTable1" style="width: 100%;border-collapse: collapse;">
                    <tr>
                        <td><strong>Значение</strong></td>
                        <td><strong>Дата изменения</strong></td>
                        <td><strong>Старое значение</strong></td>
                        <td><strong>Новое значение</strong></td>
                        <td><strong>Пользователь</strong></td>
                    </tr>
                </table>
                <table class="historyTable" style="width: 100%;border-collapse: collapse;"></table>
            </div>
        </div>
    </div>
</div>

<style>
    .sku_qe_br{white-space:pre}
    .historyTable tr,.historyTable td{border: 1px solid black;text-align:center;}
    .historyTable1 tr,.historyTable1 td{border: 1px solid black;text-align:center;}
    .historyTable td,.historyTable1 td {width: 20%;padding: 5px;}
</style>
<script>
    $(document).ready(function() { //
        $('.same_pick').selectpicker();
        $('.select2-selection__clear').on('click', function(){
            $(this).next().find('select').val('default');
            $(this).next().find('select').selectpicker("refresh");
            $(this).next().val('');
        });
        window.onload = function() {
            $('.sku_qe_br').each(function () {
                var tags = $(this).text();
                var newString = tags.replace(/,/g, ",\n");
                $(this).text(newString);
            });
        }


        $('.historyProduct').on('click', function(){
            $("#myModalBoxHistory").modal('show');

            var productid = $(this).data('productid');
            $('#myModalBoxHistoryNumber').text(productid);
            $.ajax({
                url: 'index.php?route=catalog/product/getChangeProduct&token=<?php echo $token; ?>&product_id='+productid,
                data: {
                    "product_id" : productid
                },
                dataType: 'json',
                cache: false,
                method: 'POST',
                success: function(data) {
                    $('.historyTable').html("");
                    if(data.changes.length != 0){
                        for(let i = 0; i <= data.changes.length; i++){
                            let row = "";

                            //var now = new Date(data.changes[i]["data_change"]);
                            //now = now.format("dd.mm.yyyy"); // 20.08.2012

                            if(data.changes[i]["value_name"] == "Статус") {
                                data.changes[i]["value_old"] = (data.changes[i]["value_old"] == 1) ? "Активно" : "Неактивно";
                                data.changes[i]["value_new"] = (data.changes[i]["value_new"] == 1) ? "Активно" : "Неактивно";
                            }

                            row +=	"<tr>";
                            row +=	"<td>" + data.changes[i]["value_name"] + "</td>";
                            row +=	"<td>" + data.changes[i]["data_change"] + "</td>";
                            row +=	"<td>" + data.changes[i]["value_old"] + "</td>";
                            row +=	"<td>" + data.changes[i]["value_new"] + "</td>";
                            if(data.changes[i]["firstname"] == null) {
                                row +=	"<td> Неизвестно </td>";
                            } else {
                                row +=	"<td>" + data.changes[i]["firstname"] + " " + data.changes[i]["lastname"] + "</td>";
                            }
                            row +=	"</tr>";
                            $('.historyTable').append(row);
                        }
                    }
                },
            });
        });
    });
</script>

<script>
    $(document).ready(function() {
        $(".restoreButton").on("click", function () {
            return confirm('Вы точно хотите восстановить?');
        });
    });
</script>
<script>
    $(document).ready(function() { //
        $('.selectpicker').selectpicker();
    });
</script>
<link type="text/css" href="view/stylesheet/bootstrap-select.css" rel="stylesheet" media="screen" />


<script type="text/javascript"><!--
    $('#button-filter').on('click', function() {
        var url = 'index.php?route=catalog/arhive&token=<?php echo $token; ?>';

        var filter_name = $('input[name=\'filter_name\']').val();

        if (filter_name) {
            url += '&filter_name=' + encodeURIComponent(filter_name);
        }

        var filter_length = $('#select-length').val();

        if (filter_length != '*') {
            url += '&filter_length=' + encodeURIComponent(filter_length);
        }

        var filter_model = $('#input-model').val();

        if (filter_model) {
            url += '&filter_model=' + encodeURIComponent(filter_model);
        }

        var filter_jan = $('#input-jan').val();

        if (filter_jan) {
            url += '&filter_jan=' + encodeURIComponent(filter_jan);
        }

        var filter_sku = $('#input-sku').val();

        if (filter_sku) {
            url += '&filter_sku=' + encodeURIComponent(filter_sku);
        }

        var filter_category = $('select[name=\'filter_category\']').val();

        if (filter_category != '*') {
            url += '&filter_category=' + encodeURIComponent(filter_category);
        }

        var filter_manufacturer = $('#main__manufacturer').val();

        if (filter_manufacturer != '*') {
            url += '&filter_manufacturer=' + encodeURIComponent(filter_manufacturer);
        }

        var filter_isbn = $('#input-isbn').val();

        if (filter_isbn != '*') {
            url += '&filter_isbn=' + encodeURIComponent(filter_isbn);
        }

        location = url;
    });
    //--></script>
<script type="text/javascript"><!--
    $('#input-model').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/arhive/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['product_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'filter_name\']').val(item['label']);
        }
    });

    $('#button-clear').on('click', function() {
        window.location.href = 'https://d4.by/admin/index.php?route=catalog/arhive&token=<?php echo $_GET['token'];?>';
    });

    //--></script></div>

<style>
    .form-group + .form-group {
        border-top: none !important;
    }
    input,  select{
        width: auto !important;
        border: 1px solid #000;
        border-radius: 3px;
        color:#000;
    }
    input{

        max-width: 60px;
    }
    .well input::placeholder{
        color:#000;
    }
    .btn-default{
        border-color: #000;
    }
    .btn-default:hover{
        background-color: #fff !important;
        border-color: #000;
    }
    .bootstrap-select .dropdown-menu{
        min-width:auto !important;
    }
    .bootstrap-select .dropdown-menu{
        right:unset !important;
    }
    .bs-searchbox input{
        width: 100% !important;
        max-width:100% !important;
    }
    .bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
        width: 100px;
    }
</style>
<?php echo $footer; ?>
