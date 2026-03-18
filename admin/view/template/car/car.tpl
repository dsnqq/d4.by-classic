<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content"><!-- START CONTENT -->
    <div class="page-header">
        <div class="container-fluid">
            <h1>Авто в разборе</h1>
            <ul class="breadcrumb">
                <li><a href="/admin">Главная</a></li>
                <li><a>Авто в разборе</a></li>
            </ul>
        </div>
    </div>
    <div class="flexible">
        <iframe src="https://d4.by/admin/applications/car/" width="100%" height="100%" style="border: none;"></iframe>
    </div>

    <style>
        body, html {
            overflow: hidden; !important;
        }

        #content {
            height:100% !important;
        }

        #container {
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .flexible {
            display: flex;
            width: 100%;
            height: 100%;
            flex-direction: column;
            padding-bottom: 50px;
        }
    </style>
</div><!-- END CONTENT -->
</div><!-- HELP DIV FOR COLUMN LEFT -->
<?php echo $footer; ?>
