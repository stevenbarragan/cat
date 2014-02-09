class Move
  include Game

  def initialize(moves)
    @moves = moves
  end

  def next
    return [1,3,7,9].sample if @moves.empty?

    choices = []

    if player_one_turn(@moves)
      best_score = -2

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
      best_score = 2

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

    choices.sample
  end
end
