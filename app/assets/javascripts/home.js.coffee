$('document').ready ->
  $('.start').click ->
    Game.start()

  $('.switch').click ->
    Game.switch_first()

  Game.loader = $('.loading').first().remove()

  $('#board-size').change Game.change_size

  $('#cat tr, #cat td').hide()
  $("#cat .size-3").show()
