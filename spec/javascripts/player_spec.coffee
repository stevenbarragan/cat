describe '@Player', ->
  beforeEach ->
    @subject = new Player
    @subject.char = '0'
    Game.moves = []

  describe '#update_gif', ->
    it 'moves gift to 0 posisition', ->
      @subject.update_gif()
      expect($('.indicatorO').html()).not.toBe('')

  describe '#update_score', ->
    it 'increments score by one', ->
      @subject.update_score()
      expect(@subject.score).toEqual 1

  describe '#update_board', ->
    it 'updates game moves', ->
      @subject.update_board(1)
      expect(Game.moves[0]).toEqual 1
