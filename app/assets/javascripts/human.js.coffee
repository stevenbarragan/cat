class @Human
  name: 'Human'
  char: 'O'
  turn: false
  score: 0
  first: false

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

  update_board: (pos)->
    Game.moves.push pos
    td = $('#cat').find('td')[pos - 1]
    $(td).html(@char)

  update_gif: ->
    $(".indicatorO").html(Game.loader)
    $(".indicatorX").html('')

  update_score: ->
    @score += 1
    $(".score#{ @char }").html( @score )
    $(".alert#{ @char }").show()
