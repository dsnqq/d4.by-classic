<!-- action menu modal -->
<div class="modal fade" id="aqe-modal" tabindex="-1" role="dialog" aria-labelledby="aqeModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="aqeModalLabel"></h4>
            </div>
            <div class="modal-body bull5i-container">
                <div class="notice">
                </div>
                <form enctype="multipart/form-data" id="aqeQuickEditForm" class="form-horizontal">
                    <fieldset class="aqe-modal-contents">
                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default cancel" data-dismiss="modal"><i class="fa fa-times"></i> <?php echo $button_close; ?></button>
                <button type="button" class="btn btn-primary submit" data-form="#aqeQuickEditForm" data-context="#aqe-modal" data-loading-text="<i class='fa fa-spinner fa-spin'></i> <?php echo $text_saving; ?>"><i class="fa fa-save"></i> <?php echo $button_save; ?></button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->