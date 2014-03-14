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

    false
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
    @win_paths ||= calculate_win_paths
  end

  def calculate_win_paths
    paths = []
    base = (1..@size ** 2).to_a

    while base.present?
      paths << base.shift(@size)
    end

    paths2 = paths.transpose

    pos = @size - 1

    paths3 = [[],[]]
    pos1 = 0
    pos2 = @size - 1

    paths.each do |path|
      paths3[0] << path[pos1]
      paths3[1] << path[pos2]
      pos1 += 1
      pos2 -= 1
    end

    paths + paths2 + paths3
  end

  def draw?
    @moves.size == 9
  end

  def available_moves
    (1..9).to_a - @moves
  end

  def player_one_turn
    @moves.size.even?
  end
end
