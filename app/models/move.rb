class Move
  include Game

  def initialize(moves)
    @moves = moves
  end

  def get_status
    player1 , player2 = split_movements

    if win_path?(player1)
      1
    elsif win_path?(player2)
      2
    elsif @moves.size > 8
      0
    end
  end

  def status
    @status ||= get_status
  end

  def next
    unless status
      return [1,3,7,9].sample if @moves.empty?

      choices = []

      if player_one_turn(@moves)
        best_score = -10

        available_moves(@moves).each do |move|
          new_moves = @moves + [move]

          score = minimax(new_moves)

          if score > best_score
            best_score = score
            choices = [move]
          elsif score == best_score
            choices << move
          end
        end
      else
        best_score = 10

        available_moves(@moves).each do |move|
          new_moves = @moves + [move]

          score = minimax(new_moves)

          if score < best_score
            best_score = score
            choices = [move]
          elsif score == best_score
            choices << move
          end
        end
      end

      chosed = choices.sample
      @moves << chosed

      chosed
    end
  end
end
