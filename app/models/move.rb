class Move
  include Game

  def initialize(moves)
    @moves = moves
  end

  def next
    return [1,3,7,9].sample if @moves.empty?

    choices = []

    best_score = 1

    ((1..9).to_a - @moves).each do |move|
      new_moves = @moves + [move]

      score = alphabeta(new_moves, -1, 1)

      if score > best_score
        best_score = score
        choices = [move]
      elsif score == best_score
        choices << move
      end
    end

    choices.sample
  end
end
