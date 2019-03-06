class GoalsController < ApplicationController
  before_action :set_goal, only: [ :destroy]


  # POST /goals
  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      render json: @goal, status: :created, location: @goal
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end


  # DELETE /goals/1
  def destroy
    @goal.destroy
    render json: {status: "success"}, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def goal_params
      p = JSON.parse(request.raw_post)
      params[:goal] = p
      params.require(:goal).permit([:hole, :period, :goalie_id, :game_id])
    end
end
