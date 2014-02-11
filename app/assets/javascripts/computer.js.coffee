class @Computer extends Player
  name: 'Computer'
  char: 'X'
  score: 0

  play: ->
    @update_gif()
    $.post('/next_move',
      moves: Game.moves
    ).done (data) =>
      @done(data.next)
      Game.process_status(data.status)

  done: (move) ->
    if move
      @update_board(move)
      Game.switch_turn()
