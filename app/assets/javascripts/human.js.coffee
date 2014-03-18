class @Human extends Player
  name:   'Human'
  char:   'O'
  color:  '#dff0d8'

  constructor: ->
    $('document').ready =>
      $('#cat td.size-3').each (index, td)->
        $(td).data('3', index + 1)

      $('#cat td.size-4').each (index, td)->
        $(td).data('4', index + 1)

      $('#cat td.size-5').each (index, td)=>
        $(td).data('5', index + 1)

      $('#cat td').each (index, td)=> 
        $(td).click =>
          @done( $(td).data(Game.size + '') )

  done: (value)->
    console.log( value )
    if @turn && value not in Game.moves
      @update_board(value)
      Game.switch_turn()

  play: ->
    @update_gif()
