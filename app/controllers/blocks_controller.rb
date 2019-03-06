class BlocksController < ApplicationController
  before_action :set_block, only: [ :update, :destroy]

  # POST /blocks
  def create
    @block = Block.new(block_params)

    if @block.save
      render json: @block, status: :created, location: @block
    else
      render json: @block.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blocks/1
  def destroy
    @block.destroy
    render json: {status: "success"}, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def block_params
      p = JSON.parse(request.raw_post)
      params[:block] = p
      params.require(:block).permit([:pad, :period, :goalie_id, :game_id])
    end
end
