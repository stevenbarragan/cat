class MoveController < ApplicationController
  def create
    move = Move.new(params["moves"].map &:to_i)

    next_move = {next: move.next, status: move.status}
    render json: next_move
  end
end
