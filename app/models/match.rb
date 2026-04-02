class Match < ApplicationRecord
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  validate :players_must_be_different

  def players_must_be_different
    errors.add(:base, "Players must be different") if winner_id == loser_id
  end
end