class Game
  constructor: ->
    $('document').ready =>
      $('#cat td').each (index, td)=>
        _td = $(td)
        _td.click (elem)=>
          @click(_td, index + 1)

  turn: true
  moves: []
  loader: '<img src="/assets/ajax-loader.gif">'
  playing: false

  start: ->
    $('.start, .switch').attr('disabled', true);
    $('td#score:first-child').html('')
    $('#cat td').html('')

    @moves =  []
    @playing = true
    $('.alert').hide()
    @update_gif()
    if @computer_turn()
      @play_computer()

  finish: ->
    @playing = false
    $('.btn').removeAttr('disabled')
    @update_gif()

  click: (td , value)->
    if value not in @moves && @player_turn()
      td.html('O')
      @moves.push value
      @switch_turn()
      @play_computer()

  play_computer: ->
    $.post('/next_move',
      moves: @moves
    ).done (data) =>
      @move_computer(data.next) if data.next
      @process_status(data.status)

  process_status: (status)->
    if status?
      score = parseInt $(".score#{ status }").html()
      $(".score#{ status }").html( score + 1 )
      $(".alert#{ status }").show()
      @finish()

  move_computer: (move) ->
    @switch_turn()
    @moves.push move
    td = $.find('td')[move - 1]
    $(td).html('X')

  player_turn: ->
    not @turn

  computer_turn: ->
    @turn

  switch_turn: ->
    @turn = not @turn
    @update_gif()

  update_gif: ->
    $('.indicatorX, .indicatorO').html('')
    if @playing
      $(".indicator#{ @char() }").html(@loader)

  char: ->
    if @computer_turn() then 'X' else 'O'

window.Game = new Game
