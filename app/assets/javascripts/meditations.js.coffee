
$ ->

  if $('#meditation-audio').length
    window.widget = SC.Widget( $('#meditation-audio').find('iframe')[0] )

    widget.bind SC.Widget.Events.FINISH, (data) ->
      $('.meditation-player').removeClass('playing')
      $('.play-pause').html('Finished. Play again?')

    widget.bind SC.Widget.Events.PLAY_PROGRESS, (progress) ->
      $('.meditation-progress .progress-indciator').css
        width: "#{progress.relativePosition * 100}%"


    $('.start-meditation').on 'click', (e) ->
      e.preventDefault()

      widget.play()
      $('.meditation-container').fadeIn()
      $('.meditation-player').addClass('playing').removeClass('finished')
      $('.play-pause').html('Pause')

      $('.slick-carousel').slick
        arrows: false
        autoplay: true
        autoplaySpeed: 10000
        fade: true
        infinite: true
        pauseOnHover: false
        slidesToShow: 1
        speed: 1800

    $('.meditation-container .close').on 'click', (e) ->
      e.preventDefault()

      clearInterval(window.interval)

      $('.meditation-container').fadeOut()
      widget.seekTo(0)
      widget.pause()

    $('.play-pause').on 'click', (e) ->
      e.preventDefault()
      $this = $(this)

      widget.isPaused (boolean) ->
        if boolean
          $('.meditation-player').addClass('playing')
          $this.html('Pause')
          widget.play()
        else
          $('.meditation-player').removeClass('playing')
          $this.html('Continue')
          widget.pause()


    $('.meditation-progress').on 'click', (e) ->
      e.preventDefault()

      cursor = e.offsetX / $(this).width()
      console.log(cursor * 100 + '%')

      widget.getDuration (duration) ->
        millseconds = cursor * duration
        widget.seekTo(millseconds)

