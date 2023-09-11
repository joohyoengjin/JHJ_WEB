

$(function() {
    // 사이드바 on/off
    $('#btn-menu').on('click', function() {
        $('#sidebar').addClass('on')            // class="on" 추가
    })

    $('#btn-close').on('click', function() {
        $('#sidebar').removeClass('on')         // class="on" 제거
    })
})