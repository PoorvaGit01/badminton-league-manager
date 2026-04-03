class Player < ApplicationRecord
  has_many :matches_won,  class_name: "Match", foreign_key: :winner_id, inverse_of: :winner, dependent: :restrict_with_error
  has_many :matches_lost, class_name: "Match", foreign_key: :loser_id,  inverse_of: :loser, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def wins_count
    matches_won.count
  end

  def losses_count
    matches_lost.count
  end

  def self.leaderboard
    includes(:matches_won, :matches_lost).sort_by do |p|
      [ -p.matches_won.size, p.matches_lost.size, p.name.downcase ]
    end
  end
end
