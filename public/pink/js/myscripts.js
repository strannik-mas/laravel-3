jQuery(document).ready(function ($) {
    $('.commentlist li').each(function (i) {
        $(this).find('.commentNumber').text('#' + (i+1));
    });

    $('#commentform').on('click','#submit', function (e) {
        e.preventDefault();
        var comParent = $(this);
        $('.wrap_result').css({
            'color': 'green'
        }).text('Сохранение комментария').fadeIn(500, function () {
            let data = $('#commentform').serializeArray();
            // console.log(data);
            $.ajax({
                url: $('#commentform').attr('action'),
                data: data,
                type: 'POST',
                dataType: 'JSON',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success: function (html) {
                    if(html.error){
                        $('.wrap_result').css('color', 'red').append('<br/><strong>Ошибка: </strong>' + html.error.join('<br>'));
                        $('.wrap_result').delay(2000).fadeOut(500);
                    }else if(html.success){
                        $('.wrap_result').append('<br><strong>Сохранено!</strong>').delay(2000).fadeOut(500, function () {
                            if(html.data.parent_id > 0){
                                comParent.parents('div#respond').prev().after('<ul class="children">' + html.comment + '</ul>');
                            }else {
                                if($("ol").is(".commentlist")){
                                    $('ol.commentlist').append(html.comment);
                                    $('#comments-title span').text();
                                }else{
                                    $('#respond').before('<ol class="commentlist group">' + html.comment + '</ol>');
                                }
                            }
                            $('#comments-title span').text($('#comments-title span').text()*1 + 1);
                            $('#cancel-comment-reply-link').click();
                        });
                    }
                },
                error: function (data) {
                    $('.wrap_result').css('color', 'red').append('<br/><strong>Ошибка!!!</strong>');
                    $('.wrap_result').delay(2000).fadeOut(500, function () {
                        $('#cancel-comment-reply-link').click();
                    });
                }
            });
        });
    });
});