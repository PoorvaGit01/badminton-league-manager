class Player < ApplicationRecord
  has_many :matches_won,  class_name: "Match", foreign_key: :winner_id, inverse_of: :winner
  has_many :matches_lost, class_name: "Match", foreign_key: :loser_id,  inverse_of: :loser
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.leaderboard
    includes(:matches_won, :matches_lost).sort_by do |p|
      [ -p.matches_won.size, p.matches_lost.size, p.name.downcase ]
    end
  end
end
