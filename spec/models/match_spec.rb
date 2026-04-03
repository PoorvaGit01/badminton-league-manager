require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "validations" do
    it "is valid when winner and loser are different" do
      winner = create(:player)
      loser  = create(:player)
      match = build(:match, winner: winner, loser: loser)

      expect(match).to be_valid
    end

    it "is invalid when winner and loser are the same" do
      player = create(:player)
      match = build(:match, winner: player, loser: player)

      expect(match).not_to be_valid
      expect(match.errors[:base]).to include("Winner and loser must be different players")
    end

    it "is invalid if winner is missing" do
      match = build(:match, winner: nil, loser: create(:player))
      expect(match).not_to be_valid
    end

    it "is invalid if loser is missing" do
      match = build(:match, winner: create(:player), loser: nil)
      expect(match).not_to be_valid
    end

    it "validates presence of winner on create" do
      match = Match.new(winner: nil, loser: nil)
      expect(match).not_to be_valid
      expect(match.errors[:winner]).to be_present
    end
  end
end
