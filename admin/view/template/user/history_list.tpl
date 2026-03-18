<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">

            <h1>История пользователей</h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><?php echo $breadcrumb['text']; ?></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-user">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td class="text-left">Имя</td>
                                <td class="text-left"><?php echo $column_username; ?></td>
                                <td class="text-left"><?php echo $column_status; ?></td>
                                <td class="text-right"><?php echo $column_action; ?></td>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if ($users) { ?>
                            <?php foreach ($users as $user) { ?>
                            <tr <?php echo($user['status'] == "Неактивно") ? "style='color:red;'": ""; ?>>
                                <td class="text-left"><?php echo $user['firstname']; ?> <?php echo $user['lastname']; ?></td>
                                <td class="text-left"><?php echo $user['username']; ?></td>
                                <td class="text-left"><?php echo $user['status']; ?></td>
                                <td class="text-right"><a href="<?php echo $user['edit']; ?>" data-toggle="tooltip" class="btn btn-primary">Смотреть</a></td>
                            </tr>
                            <?php } ?>
                            <?php } else { ?>
                            <tr>
                                <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
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
</div>
<?php echo $footer; ?>