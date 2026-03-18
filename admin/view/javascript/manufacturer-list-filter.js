$('body').on('change', '.manufacture-pick', function (){
    let thisValue = $(this).find('option:selected').data('key');
    $('.mfilter-manufacturer-list').find('input[name^="manufacturers"]').prop('checked', false);

    $('.mfilter-manufacturer-list').find('input[name="manufacturers"]').each(function (){
        if($(this).data('keys') == thisValue){
            $(this).prop('checked', true);

            if(parseInt(thisValue) == 263){ // Дисплей
                $('[data-keys="264"]').prop('checked', true);
            }
        }
    });
});
