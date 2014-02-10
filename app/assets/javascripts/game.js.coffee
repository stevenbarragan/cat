class Game
  turn: false #machine turn
  moves: []

  constructor: ->
    $('document').ready =>
      $('#cat td').each (index, td)=>
        _td = $(td)
        _td.click (elem)=>
          @click(_td, index)

  click: (td , value)->
    if value not in @moves && @player_turn()
      td.html('O')
      @moves.push value
      @switch_turn()
      @play_computer()

  play_computer: ->
    @switch_turn()

  player_turn: ->
    not @turn

  computer_turn: ->
    @turn

  switch_turn: ->
    @turn = not @turn

Window.Game = new Game
