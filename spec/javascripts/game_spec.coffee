describe '@GameFactory', ->
  beforeEach ->
    @subject = new GameFactory

  describe '#player', ->
    describe 'with player_index in 0', ->
      it 'returns a computer player', ->
        expect(@subject.player().name).toEqual 'Computer'

    describe 'with player_index in 1', ->
      beforeEach ->
        @subject.player_index = 1

      it 'returns a human player', ->
        expect(@subject.player().name).toEqual 'Human'

  describe '#first_player', ->
    describe 'with first in 0', ->
      it 'returns a computer player', ->
        expect(@subject.first_player().name).toEqual 'Computer'

    describe 'with first in 1', ->
      beforeEach ->
        @subject.first = 1

      it 'returns a human player', ->
        expect(@subject.first_player().name).toEqual 'Human'

  describe '#start', ->
    beforeEach ->
      spyOn @subject, 'lockButtons'
      spyOn @subject, 'unhighliht_winning_path'

      @subject.start()

    it 'empty moves', ->
      expect(@subject.moves).toEqual []

    it 'sets player index at first player', ->
      expect(@subject.player_index).toEqual @subject.first

    it 'calls lockButtons', ->
      expect(@subject.lockButtons).toHaveBeenCalled()

    it 'calls unhighliht_winning_path', ->
      expect(@subject.unhighliht_winning_path).toHaveBeenCalled()

  describe '#finish', ->
    beforeEach ->
      spyOn @subject, 'unlockButtons'
      spyOn @subject, 'update_gif'
      spyOn @subject, 'switch_first'

      @subject.finish()

    it 'calls update_gif', ->
      expect(@subject.update_gif).toHaveBeenCalled()

    it 'calls unlockButtons', ->
      expect(@subject.unlockButtons).toHaveBeenCalled()

    it 'calls switch_first', ->
      expect(@subject.switch_first).toHaveBeenCalled()

    it 'sets players turn to false', ->
      expect(@subject.players[0].turn).toBeFalsy()
      expect(@subject.players[1].turn).toBeFalsy()

  describe '#process_status', ->
    it 'increments computer score', ->
      @subject.process_status(1, [])

      expect(@subject.players[0].score).toEqual 1

    it 'increments computer score', ->
      @subject.process_status(2, [])

      expect(@subject.players[1].score).toEqual 1

  describe '#winner', ->
    describe 'with first at 0', ->
      it 'returns first player', ->
        expect(@subject.winner(1).name).toEqual 'Computer'

      it 'returns second player', ->
        expect(@subject.winner(2).name).toEqual 'Human'

    describe 'with first at 1', ->
      beforeEach ->
        @subject.first = 1

      it 'returns first player', ->
        expect(@subject.winner(1).name).toEqual 'Human'

      it 'returns second player', ->
        expect(@subject.winner(2).name).toEqual 'Computer'

  describe '#switch_turn', ->
    describe 'with computer turn', ->
      beforeEach ->
        @subject.switch_turn()

      it 'switch turn to human player', ->
        expect(@subject.players[0].turn).toBeFalsy()
        expect(@subject.players[1].turn).toBeTruthy()

    describe 'with human turn', ->
      beforeEach ->
        @subject.player_index = 1
        @subject.switch_turn()

      it 'switch turn to human player', ->
        expect(@subject.players[0].turn).toBeTruthy()
        expect(@subject.players[1].turn).toBeFalsy()

  describe '#switch_turn', ->
    it 'switch first from 0 to 1', ->
      @subject.switch_first()
      expect(@subject.first).toEqual 1

    it 'switch first from 1 to 0', ->
      @subject.first = 1
      @subject.switch_first()
      expect(@subject.first).toEqual 0
