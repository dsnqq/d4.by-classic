<div id="myModalBoxHistory" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Заголовок модального окна -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">История запчасти <div style="font-size: 13px;" class="modal-subtitle"></div></h4>
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

            <div id="loaderHistory">
                <img src="/admin/view/images/loading.gif" alt="Загрузка" title="Загрузка" />
            </div>
        </div>
    </div>
</div>