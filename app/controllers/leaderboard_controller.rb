class LeaderboardController < ApplicationController
  def index
    @players = Player.all.sort_by { |p| -p.wins_count }
  end
end