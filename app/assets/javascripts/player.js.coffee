class @Player
  turn: false
  score: 0

  update_gif: ->
    $(".indicatorX, .indicatorO").html('')
    $(".indicator#{ @char }").html(Game.loader)

  update_score: ->
    @score += 1
    $(".score#{ @char }").html( @score )
    $(".alert#{ @char }").show()

  update_board: (pos)->
    Game.moves.push pos
    $("#cat td:eq(#{pos - 1})").html(@char)

