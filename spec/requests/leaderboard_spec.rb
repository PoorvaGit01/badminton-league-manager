require 'rails_helper'

RSpec.describe "Leaderboard", type: :request do
  describe "GET /index" do
    it "returns a successful response" do
      get leaderboard_path  # correct helper
      expect(response).to have_http_status(:ok)  # HTTP 200
    end
  end
end