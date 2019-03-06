class GoaliesController < ApplicationController
  before_action :set_goaly, only: [:show, :update, :destroy]

  # GET /goalies
  def index
    goalieArray = Goalie.search(params[:search_string])
    @goalies = goalieArray.map {|goalie| goalie.return_table_info_for_goalie()}
    render json: @goalies
  end

  # GET /goalies/1
  def show
    render json: @goaly
  end

  # POST /goalies
  def create
    @goaly = Goalie.new(goaly_params)

    if @goaly.save
      render json: @goaly, status: :created, location: @goaly
    else
      render json: @goaly.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /goalies/1
  # def update
  #   if @goaly.update(goaly_params)
  #     render json: @goaly
  #   else
  #     render json: @goaly.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /goalies/1
  # def destroy
  #   @goaly.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goaly
      @goaly = Goalie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def goaly_params
      params.fetch(:goaly, {})
    end
end
