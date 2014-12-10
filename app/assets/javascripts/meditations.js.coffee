
$ ->
  FastClick.attach(document.body)

  $('.start-meditation').on 'click', (e) ->
    e.preventDefault()

    $('.meditation-container').fadeIn()
    $('.meditation-player').addClass('playing').removeClass('finished')

    $('.slick-carousel').slick
      arrows: false
      autoplay: true
      autoplaySpeed: 10000
      fade: true
      infinite: true
      pauseOnHover: false
      slidesToShow: 1
      speed: 1800

    $('.sc-play').click() if !$('.sc-player').hasClass('playing')

  $('.meditation-container .close').on 'click', (e) ->
    e.preventDefault()
    clearInterval(window.interval)

    $('.meditation-container').fadeOut()
    $('.sc-pause').click() if $('.sc-player').hasClass('playing')
