module Game
  def win_path(path)
    win_paths.any? do |win_path|
      win_path.all?{ |x| path.include? x }
    end
  end

  def win_paths?(path)
    moves1, moves2 = split_movements(path)
    win_path(moves1) || win_path(moves2)
  end

  def split_movements(path)
    m = path.each_slice(2).to_a
    m[-1] = m[-1] << nil if m[-1].size == 1
    m.transpose.map(&:compact)
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

  def alphabeta(moves, alpha, beta)
    if moves.size == 9
      return 0
    else
      moves1 , moves2 = Game.split_movements(moves)

      return 1  if Game.win_path(moves1)
      return -1 if Game.win_path(moves2)
    end

    available_moves = (1..9).to_a - moves

    if moves.size.even?
      available_moves.each do |move|
        new_moves = moves + [move]

        score = alphabeta(new_moves, alpha, beta)

        alpha = score if score > alpha
        break if alpha >= beta
      end

      return alpha
    else
      available_moves.each do |move|
        new_moves = moves + [move]

        score = alphabeta(new_moves, alpha, beta)

        beta = score if score < beta
        break beta if alpha >= beta
      end

      return beta
    end
  end
end
