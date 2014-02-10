class MoveController < ApplicationController
  def create
    moves = params['moves'] ? params["moves"].map(&:to_i) : []
    move = Move.new(moves)
    next_move = {next: move.next, status: move.status}
    render json: next_move
  end
end
