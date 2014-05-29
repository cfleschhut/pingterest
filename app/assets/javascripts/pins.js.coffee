$ ->
  $container = $('#pins')

  $container.imagesLoaded ->
    $container.masonry
      isFitWidth: true
