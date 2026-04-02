class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path
    else
      render :new
    end
  end

  def destroy
    Player.find(params[:id]).destroy
    redirect_to players_path
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end