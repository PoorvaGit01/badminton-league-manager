# spec/controllers/players_controller_spec.rb
require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  let!(:player) { create(:player, name: "Alice") }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new player and redirects" do
        expect {
          post :create, params: { player: { name: "Bob" } }
        }.to change(Player, :count).by(1)

        expect(response).to redirect_to(players_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a player and returns unprocessable entity" do
        expect {
          post :create, params: { player: { name: "" } }
        }.not_to change(Player, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when player exists" do
      it "removes the player and redirects" do
        expect {
          delete :destroy, params: { id: player.id }
        }.to change(Player, :count).by(-1)

        expect(response).to redirect_to(players_path)
      end
    end

    context "when player does not exist" do
      it "redirects with alert" do
        delete :destroy, params: { id: 0 } # non-existent
        expect(response).to redirect_to(players_path)
      end
    end
  end
end
