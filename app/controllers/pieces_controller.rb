class PiecesController < ApplicationController
  before_action :authenticate_user!

  def show
    @piece = Piece.find_by_id(params[:id])
    if @piece.blank?
      return render_not_found
    # else
    #   #need to edit the database.
    #   #Single table inheritance uses the "type" field to connect the types of pieces to the pieces table.
    #   #need to add another field to store type or rename type field.
    #   render json: @piece
    end
    @game = @piece.game
    @pieces = @game.pieces.all
  end

  def update
    @piece = Piece.find_by_id(params[:id])
    @game = @piece.game
    if @piece.is_capturable?(1, 3)
      @piece.captured!(1, 3)
    else
      @piece.move_action(1, 3)
    end
    @piece.save
    redirect_to game_path(@game)
  end

  private

  def render_not_found(status=:not_found)
    render plain: "#{status.to_s.titleize} :(", status: status
  end
end
