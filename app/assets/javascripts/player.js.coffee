class @Player
  constructor: ->
    $('document').ready =>
      @loader = $('.loading').remove()

  turn: false
  score: 0

  update_gif: ->
    $(".indicatorX, .indicatorO").html('')
    $(".indicator#{ @char }").html(@loader)

  update_score: ->
    @score += 1
    $(".score#{ @char }").html( @score )
    $(".alert#{ @char }").show()

  update_board: (pos)->
    Game.moves.push pos
    td = $('#cat').find('td')[pos - 1]
    $(td).html(@char)

