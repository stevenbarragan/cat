class @Computer
  name: 'Computer'
  char: 'X'
  turn: false
  score: 0
  first: false

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

  update_board: (pos)->
    Game.moves.push pos
    td = $('#cat').find('td')[pos - 1]
    $(td).html(@char)

  update_gif: ->
      $('.indicatorO').html('')
      $(".indicatorX").html(Game.loader)

  update_score: ->
    @score += 1
    $(".score#{ @char }").html( @score )
    $(".alert#{ @char }").show()
