class PlayersController < ApplicationController
  before_action :set_player, only: :destroy

  def index
    @players = Player.order(:name)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to players_path, notice: t(".success")
    else
      flash.now[:alert] = t(".failure")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @player.destroy
      redirect_to players_path, notice: t(".success")
    else
      redirect_to players_path, alert: t(".failure")
    end
  end

  private

  def set_player
    @player = Player.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to players_path, alert: t(".not_found")
  end

  def player_params
    params.require(:player).permit(:name)
  end
end
