class Player < ApplicationRecord
  has_many :won_matches, class_name: "Match", foreign_key: :winner_id
  has_many :lost_matches, class_name: "Match", foreign_key: :loser_id

  validates :name, presence: true, uniqueness: true

  def wins_count
    won_matches.count
  end

  def losses_count
    lost_matches.count
  end
end