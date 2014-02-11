class @Game
  constructor: ->
    @players = [new Computer, new Human]
    @first = 0
    @player_index = 0

    $('document').ready =>
      $('.start').click =>
        @start()
      $('.switch').click =>
        @switch_first()

  moves: []

  player: ->
    @players[@player_index]

  start: ->
    @moves =  []
    @player_index = @first
    @lockButtons()
    @player().play()

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

  process_status: (status)->
    if status?
      if status == 0
        score = parseInt $(".score3").html()
        $(".score3").html( score + 1 )
        $(".alert3").show()
      else
        if status == 1
          @players[@first].update_score()
        else
          @players[if @first = 0 then 1 else 0].update_score()

      @finish()

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
