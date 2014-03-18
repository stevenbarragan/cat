class MoveController < ApplicationController
  def create
    moves = params['moves'] ? params["moves"].map(&:to_i) : []
    move = Move.new(moves, nil, params['size'].to_i )
    next_move = {next: move.next, status: move.status, win_path: move.win_path}
    render json: next_move
  end
end
