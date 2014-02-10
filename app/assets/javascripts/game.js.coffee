class Game
  turn: 'X'

  constructor: ->
    $('document').ready =>
      index = 1

      $('#cat td').each (index, td)=>
        _td = $(td)
        _td.click (elem)=>
          @click(index)

        _td.hover(
          =>
            _td.html(@turn) unless _td.data('blocked')
          =>
            _td.html('') unless _td.data('blocked')
        )

  click: (value)->
    console.log value

Window.Game = new Game
