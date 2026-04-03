# spec/models/player_spec.rb
require 'rails_helper'

RSpec.describe Player, type: :model do
  # Associations
  it { should have_many(:matches_won).class_name('Match').with_foreign_key('winner_id').inverse_of(:winner) }
  it { should have_many(:matches_lost).class_name('Match').with_foreign_key('loser_id').inverse_of(:loser) }

  # Validations
  subject { build(:player) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }


  # Class methods
  describe ".leaderboard" do
    it "returns players sorted by wins desc, losses asc, then name" do
      player_a = create(:player, name: "Alice")
      player_b = create(:player, name: "Bob")
      player_c = create(:player, name: "Charlie")

      2.times { create(:match, winner: player_a, loser: player_b) }
      create(:match, winner: player_c, loser: player_a)
      create(:match, winner: player_b, loser: player_c)

      leaderboard = Player.leaderboard
      expect(leaderboard.map(&:name)).to eq([ "Alice", "Charlie", "Bob" ])
    end
  end
end
