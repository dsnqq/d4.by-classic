$(document).ready(function(){
    $('.burg').on('click', function(){
        if($(this).hasClass('open')){
            $(this).removeClass('open');
            $('.header_bottom_menu').fadeOut();

        } else{
            $(this).addClass('open');
            $('.header_bottom_menu').fadeIn();

        }
    });
    $('.xxeww').on('click', function(){
        if($(this).hasClass('_xx')){
            $(this).removeClass('_xx');
            $('li[data-id="ean"]').hide();
            $('li[data-id="upc"]').hide();
            $('li[data-id="jan"]').hide();
            $('li[data-id="isbn"]').hide();
            $('li[data-id="model"]').hide();

        }else{
            $(this).addClass('_xx');
            $('li[data-id="ean"]').show();
            $('li[data-id="upc"]').show();
            $('li[data-id="jan"]').show();
            $('li[data-id="isbn"]').show();
            $('li[data-id="model"]').show();
        }
    });


/*
    $('.btn_add_carte').on('click', function(){
        $('.overlay_form').fadeIn();
    });
    $('.closesinh').on('click', function(){
        $('.overlay_form').fadeOut();
    });


    // отправка с главной
    $(".btn_calling").click(function(e) {
        if($('#formCalling input[name="phone"]').val() != ""){
            e.preventDefault();
            $.ajax({
                type: "POST",
                url: "/",
                data: $("#formCalling").serialize(),
                success: function(data) {
                    $('.overlay_form').fadeOut();
                    $('#formCalling  input[name="phone"]').val('');
                    $('#formCalling  input[name="name"]').val('');
                }
            });
        }else{
            alert('Заполните поле телефон!');
        }
    });*/
    if (typeof display_MFP === 'function' && $('#list-view').length) {
        try {
            var initialDisplay = null;
            try {
                initialDisplay = localStorage.getItem('display');
            } catch (e2) {}
            display_MFP(initialDisplay || 'list');
        } catch (e) {
            display_MFP('list');
        }
        try {
            var $box = $('#mfilter-content-container');
            if (!$box.length) {
                $box = $('#content');
            }
            $box.find('.row_s').addClass('view');
        } catch (e3) {}
    }
});

$(function() {
    var $btn = $('#scroll-to-top');
    if (!$btn.length) {
        return;
    }
    var threshold = 280;
    function updateScrollTopBtn() {
        if ($(window).scrollTop() > threshold) {
            $btn.addClass('is-visible');
        } else {
            $btn.removeClass('is-visible');
        }
    }
    $(window).on('scroll', updateScrollTopBtn);
    updateScrollTopBtn();
    $btn.on('click', function() {
        $('html, body').stop().animate({ scrollTop: 0 }, 480);
    });
});