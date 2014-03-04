describe '@computer', ->
  beforeEach ->
    @subject = new Computer
    Game.moves = []

  describe '#done', ->
    it 'update board', ->
      @subject.done(5)
      expect(Game.moves[0]).toEqual 5
