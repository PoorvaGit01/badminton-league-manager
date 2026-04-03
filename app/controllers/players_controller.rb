class PlayersController < ApplicationController
  def index
    @players = Player.order(:name)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path, notice: "Player added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy!
    redirect_to players_path, notice: "Player removed."
  rescue ActiveRecord::RecordNotDestroyed, ActiveRecord::RecordNotFound
    redirect_to players_path, alert: "Could not remove player."
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end