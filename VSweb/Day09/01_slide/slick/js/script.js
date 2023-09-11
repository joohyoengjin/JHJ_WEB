

$(function() {
    
    // 슬라이드 시작!
    $('.#slide-container').slick({
        dots: true,         /* 닷츠 */
        arrow: true,        /* 화살표 */
        infinite: true,     /* 무한 반복 */
        speed: 300,         /* 슬라이드 전환 시간 */
        slidesToShow: 1,     /* 슬라이드 개수 */
        slideToScroll: 1,    /* 스크롤될 슬라이드 개수 */

        autoplay: true,       /* 자동 재생 */
        autoplaySpeed: 3000, /* 자동재생 시간 */

        pauseOnDotsHover: false,    /* 닷츠 호버 시 자동재생 멈충 */
        pauseOnFocus:   false,      /* 포커스 시 자동재생 멈춤 */
        pauseOnHover:   false,      /* 호버 시 자동재생 멈춤 */

        /* 효과 */
        //fade:true,

        /* 반응형 */
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1,
                }
            },
            {
                breakpoint: 800,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2,
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1,
                }
            },
    
        ]
})
})