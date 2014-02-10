$('document').ready ->
  $('.switch').click ->
    Game.switch_turn()
    name = if Game.turn then 'Computer' else 'You'
    $('.player_name').html("First player: #{name}")
