class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]
  
  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create

    data = JSON.parse request.raw_post
    home = data["games"]["home"]
    away = data["games"]["away"]
    home_goalie = Goalie.find_or_create_by(first_name: home["firstName"], last_name: home["lastName"], team: home["teamName"])
    away_goalie = Goalie.find_or_create_by(first_name: away["firstName"], last_name: away["lastName"], team: away["teamName"])
    @home_game = Game.create(goalie_id: home_goalie.id, date: home["date"], opposing_team: away_goalie.team, home_bool: true)
    @away_game = Game.create(goalie_id: away_goalie.id, date: away["date"], opposing_team: home_goalie.team, oppsoing_game_id: @home_game.id, home_bool: false)
    @home_game.oppsoing_game_id = @away_game.id
    @home_game.save
    @return_data = {games:
      {
        away: @away_game,
        home: @home_game
      }
    }
    # if @game.save
      render json: @return_data, status: 200
    # else
    #   render json: @game.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  # def destroy
  #   @game.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:period,:cons_saves, :pass, :left_crease, :waved_icing)
    end
end
