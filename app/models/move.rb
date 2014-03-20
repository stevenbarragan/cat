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

  def next
    moves = available_moves.map do |move|
      Move.new(@moves + [move], @size)
    end

    moves.map &:score

    @choices = [moves.shift]

    score = @choices.last.score

    moves.each do |move|
      if player_one_turn
        if move.score > score
          @choices = [move]
          score = move.score
        elsif move.score == score
          @choices << move
        end
      else
        if move.score < score
          @choices = [move]
          score = move.score
        elsif move.score == score
          @choices << move
        end
      end
    end

    @moves << @choices.sample.move
    @moves.last
  end

  def score
    @score ||= get_score
  end

  def get_score(alpha = - @last_move - 1, beta = @last_move + 1)
    if status
      calculate_value_from_status
    else
      nexts = []

      if player_one_turn
        available_moves.each do |move|
          new_move = Move.new(@moves + [move], @size) 
          score = new_move.get_score( alpha, beta )

          alpha = score if score > alpha
          return alpha if alpha >= beta
        end

        return alpha
      else
        available_moves.each do |move|
          new_move = Move.new(@moves + [move], @size) 
          score = new_move.get_score( alpha, beta)

          beta = score if score < beta
          return beta if alpha >= beta
        end

        return beta
      end
    end
  end

  def nextx
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
