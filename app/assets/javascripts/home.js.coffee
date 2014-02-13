$('document').ready ->
  $('.switch').click ->
    Game.switch_turn()
    $('.player_name').html("First player: #{Game.payer().name}")

  $('.start').click ->
    Game.start()
