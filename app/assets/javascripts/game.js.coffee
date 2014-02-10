class Game
  turn: false #machine turn
  moves: []

  constructor: ->
    $('document').ready =>
      $('#cat td').each (index, td)=>
        _td = $(td)
        _td.click (elem)=>
          @click(_td, index + 1)

  click: (td , value)->
    if value not in @moves && @player_turn()
      td.html('O')
      @moves.push value
      @switch_turn()
      @play_computer()

  play_computer: ->
    $.post('/next_move',
      moves: @moves
    ).done (data) =>
      @move_computer(data.next) if data.next

      if data.status
        alert data.status

  move_computer: (move) ->
    @switch_turn()
    @moves.push move
    td = $.find('td')[move - 1]
    $(td).html('X')

  player_turn: ->
    not @turn

  computer_turn: ->
    @turn

  switch_turn: ->
    @turn = not @turn

Window.Game = new Game
