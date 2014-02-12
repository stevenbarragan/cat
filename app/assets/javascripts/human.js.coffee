class @Human extends Player
  name: 'Human'
  char: 'O'
  color: '#dff0d8'

  constructor: ->
    $('document').ready =>
      $('#cat td').each (index, td)=>
        _td = $(td)
        _td.click (elem)=>
          @done(_td, index + 1)

  done: (td , value)->
    if @turn && value not in Game.moves
      @update_board(value)
      Game.switch_turn()

  play: ->
    @update_gif()

