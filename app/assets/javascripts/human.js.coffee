class @Human extends Player
  name: 'Human'
  char: 'O'

  constructor: ->
    $('document').ready =>
      $('#cat td').each (index, td)=>
        _td = $(td)
        _td.click (elem)=>
          @done(_td, index + 1)

  done: (td , value)->
    if value not in Game.moves && @turn
      @update_board(value)
      Game.switch_turn()

  play: ->
    @turn = true
    @update_gif()

