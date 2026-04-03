class Match < ApplicationRecord
  belongs_to :winner, class_name: "Player", inverse_of: :matches_won
  belongs_to :loser,  class_name: "Player", inverse_of: :matches_lost

  validate :winner_and_loser_must_differ

  private

  def winner_and_loser_must_differ
    return if winner_id.blank? || loser_id.blank?

    errors.add(:base, "Winner and loser must be different players") if winner_id == loser_id
  end
end
