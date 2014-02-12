module Game
  def win_path?(path)
    win_paths.any? do |win_path|
      win_path.all?{ |x| path.include? x }
    end
  end

  def win_path
    moves = split_movements

    moves.each do |move|
      win_paths.each do |win_path|
        return win_path if (win_path - move).empty?
      end
    end
  end

  def win_paths?(path)
    moves1, moves2 = split_movements(path)
    win_path?(moves1) || win_path?(moves2)
  end

  def split_movements(path = @moves)
    if path.size > 0
      m = path.each_slice(2).to_a
      m[-1] = m[-1] << nil if m[-1].size == 1
      m.transpose.map(&:compact)
    else
      [[], []]
    end
  end

  def win_paths
    [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7]
    ]
  end

  def minimax(moves)
    moves1, moves2 = split_movements(moves)

    return 10 - moves.size  if win_path?(moves1)
    return 0 - moves.size   if win_path?(moves2)
    return 0 if draw(moves)

    if player_one_turn(moves)
      best_score = -2

      available_moves(moves).each do |move|
        score = minimax(moves + [move])

        best_score = score if score > best_score
      end

      best_score
    else
      best_score = 2

      available_moves(moves).each do |move|
        score = minimax(moves + [move])

        best_score = score if score < best_score
      end

      best_score
    end
  end

  def draw(moves)
    moves.size == 9
  end

  def available_moves(moves = @moves)
    (1..9).to_a - moves
  end

  def player_one_turn(moves)
    moves.size.even?
  end
end
