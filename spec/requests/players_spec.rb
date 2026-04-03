require 'rails_helper'

RSpec.describe "Players", type: :request do
  let!(:player) { create(:player, name: "Alice") }

  describe "GET /index" do
    it "returns a successful response" do
      get players_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /new" do
    it "returns a successful response" do
      get new_player_path
      expect(response).to have_http_status(:ok)
    end
  end


  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new player and redirects" do
        expect {
          post players_path, params: { player: { name: "Bob" } }
        }.to change(Player, :count).by(1)

        expect(response).to redirect_to(players_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a player and returns unprocessable entity" do
        expect {
          post players_path, params: { player: { name: "" } }
        }.not_to change(Player, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    context "when player exists" do
      it "removes the player and redirects" do
        expect {
          delete player_path(player)
        }.to change(Player, :count).by(-1)

        expect(response).to redirect_to(players_path)
      end
    end

    context "when player does not exist" do
      it "redirects with alert" do
        delete player_path(id: 0)  # non-existent
        expect(response).to redirect_to(players_path)
        follow_redirect!
      end
    end
  end
end