class Move
  include Game
  attr_accessor :move, :score

  def initialize(moves = [], score = nil)
    @moves = moves
    @move  = @moves.last
    @score = score
    @choices = []
  end

  def calculate_payers_path
    @player_one_moves , @player_two_moves = split_movements
  end

  def status
     get_status
  end

  def corners
    [1,3,7,9].map{ |move| Move.new [move], 10 }
  end

  def score
    @score ||= get_score
  end

  def get_score
    if status
      calculate_value_from_status
    else
      if @moves.empty?
        @choices = corners
        return @choices.first.score
      end

      nexts = []

      available_moves.each do |move|
        nexts << Move.new(@moves + [move])
      end

      nexts.map &:score

      if player_one_turn
        move = nexts.max_by{ |move| move.score }
      else
        move = nexts.min_by{ |move| move.score }
      end

      @choices = nexts.select{ |next_move| next_move.score == move.score }

      move.score
    end
  end

  def next
    if score
      random = @choices.sample
      if random
        @moves << random.move
        @moves.last
      end
    end
  end

  private

  def get_status
    calculate_payers_path

    return 1 if win_path? @player_one_moves
    return 2 if win_path? @player_two_moves
    return 0 if draw?
  end

  def calculate_value_from_status
    case status
    when 1
      10 - @moves.size + 1
    when 2
      - (@moves.size + 1)
    when 0
      0
    end
  end
end
