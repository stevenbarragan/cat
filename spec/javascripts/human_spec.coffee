describe '@Human', ->
  beforeEach ->
    @subject = new Human
    Game.moves = []

  describe '#done', ->
    describe 'when it is not human turn', ->
      beforeEach ->
        @subject.turn = false

      it 'update board', ->
        @subject.done(5)
        expect(Game.moves).toEqual []


    describe 'when it is human turn', ->
      beforeEach ->
        @subject.turn = true

      it 'update board', ->
        @subject.done(5)
        expect(Game.moves[0]).toEqual 5

  describe '#play', ->
    beforeEach ->
      spyOn @subject, 'update_gif'

    it 'calls update_gif method', ->
      @subject.play()
      expect(@subject.update_gif).toHaveBeenCalled()
