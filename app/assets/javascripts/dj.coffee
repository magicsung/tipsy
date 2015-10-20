$ ->
  $('#masonry-container').imagesLoaded ->
    $('#masonry-container').masonry
      itemSelector: '.box'
      isFitWidth: true
      columnWidth: 10
      gutterWidth: 10
      columnWidth: (containerWidth) ->
        if $(window).width() > 1600
          return containerWidth /7
        else if $(window).width() > 1200 && $(window).width() <= 1600
          return containerWidth /6
        else if $(window).width() > 1000 && $(window).width() <= 1200
          return containerWidth /5
        else if $(window).width() > 800 && $(window).width() <= 1000
          return containerWidth /4
        else if $(window).width() > 550 && $(window).width() <= 800
          return containerWidth /3
        else
          return containerWidth /1