class MatchesController < ApplicationController
  before_action :load_players, only: %i[new create]

  def index
    @matches = Match.includes(:winner, :loser)
                    .order(created_at: :desc)
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to matches_path, notice: t(".success", default: "Match recorded.")
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def load_players
    @players = Player.order(:name)
  end

  def match_params
    params.require(:match).permit(:winner_id, :loser_id)
  end
end
