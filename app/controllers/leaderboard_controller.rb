class LeaderboardController < ApplicationController
  def index
    @players = Player.leaderboard
  end
end