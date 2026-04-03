# spec/controllers/matches_controller_spec.rb
require 'rails_helper'

RSpec.describe MatchesController, type: :controller do
  let!(:player1) { create(:player, name: "Alice") }
  let!(:player2) { create(:player, name: "Bob") }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #new" do
    it "renders the new match form" do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new match and redirects" do
        expect {
          post :create, params: { match: { winner_id: player1.id, loser_id: player2.id } }
        }.to change(Match, :count).by(1)

        expect(response).to redirect_to(matches_path)
      end
    end

    context "with invalid parameters" do
      it "does not create match when winner = loser" do
        expect {
          post :create, params: { match: { winner_id: player1.id, loser_id: player1.id } }
        }.not_to change(Match, :count)

        expect(response).to have_http_status(:unprocessable_entity).or have_http_status(:ok)
      end
    end
  end
end
