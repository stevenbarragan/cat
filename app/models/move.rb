class Move
  include Game
  attr_accessor :move, :score

  def initialize(moves = [], size = 3, score = nil)
    @moves = moves
    @move  = @moves.last
    @score = score
    @size = size
    @choices = []
    @last_move = @size ** 2
  end

  def calculate_payers_path
    @player_one_moves , @player_two_moves = split_movements
  end

  def status
     get_status
  end

  def corners
    [1,@size, @last_move - @size + 1, @last_move ].map{ |move| Move.new [move], @size, @last_move }
  end

  def score
    @score ||= get_score
  end

  def get_score()
    if status
      calculate_value_from_status
    else
      if @moves.empty?
        @choices = corners
        return @choices.sample.score
      end

      nexts = []

      available_moves.each do |move|
        nexts << Move.new(@moves + [move], @size)
      end

      nexts.map &:score

      move = nexts.shift
      @choices = [move]

      if player_one_turn
        nexts.each do |next_move|
          if next_move.score > move.score
            move = next_move
            @choices = [move]
          elsif next_move.score == move.score
            @choices << next_move
          end
        end
      else
        nexts.each do |next_move|
          if next_move.score < move.score
            move = next_move
            @choices = [move]
          elsif next_move.score == move.score
            @choices << next_move
          end
        end
      end

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
      @last_move - @moves.size + 1
    when 2
      @moves.size - @last_move - 1 
    when 0
      0
    end
  end
end
