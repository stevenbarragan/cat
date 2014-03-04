class @Game
  constructor: ->
    @players = [new Computer, new Human]
    @first = 0
    @player_index = 0

    $('document').ready =>
      @loader = $('.loading').first().remove()
      $('.start').click =>
        @start()
      $('.switch').click =>
        @switch_first()

  moves: []

  player: ->
    @players[@player_index]

  first_player: ->
    @players[@first]

  start: ->
    @moves =  []
    @player_index = @first
    @lockButtons()
    @unhighliht_winning_path()
    @first_player().turn = true
    @first_player().play()

  finish: ->
    @update_gif()
    @unlockButtons()
    @players[0].turn = false
    @players[1].turn = false
    @switch_first()

  lockButtons: ->
    $('.start, .switch').attr('disabled', true);
    $('#cat td').html('')
    $('.alert').hide()

  unlockButtons: ->
    $('.btn').removeAttr('disabled')

  process_status: (status, win_path)->
    if status?
      if status == 0
        score = parseInt $(".score3").html()
        $(".score3").html( score + 1 )
        $(".alert3").show()
      else
        winner = @winner(status)
        @highlight_winning_path(win_path, winner.color)
        winner.update_score()

      @finish()

  winner: (player_turn)->
    if player_turn == 1
      @players[@first]
    else
      @players[if @first == 0 then 1 else 0]


  highlight_winning_path: (path, color)->
    if path
      for position in path
        $("#cat td:eq(#{ position - 1})").css('color', color)

  unhighliht_winning_path: ->
    $('#cat td').css('color', '#333' )

  switch_turn: ->
    @player().turn = false
    @player_index = if @player_index == 0 then 1 else 0

    @player().turn = true
    @player().play()

  switch_first: ->
    @first = if @first == 0 then 1 else 0
    $('.player_name').html("First player: #{ @players[@first].name }")

  update_gif: ->
    $('.indicatorX, .indicatorO').html('')

window.Game = new Game
