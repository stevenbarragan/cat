class @Computer extends Player
  name: 'Computer'
  char: 'X'
  score: 0
  color: '#a94442'

  play: ->
    if @turn
      @update_gif()
      $.post('/next_move',
        moves: Game.moves
        size: Game.size
      ).done (data) =>
        @done(data.next)
        Game.process_status(data.status, data.win_path)

  done: (move) ->
    if move
      @update_board(move)
      Game.switch_turn()
