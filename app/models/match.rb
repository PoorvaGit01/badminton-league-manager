class Match < ApplicationRecord
  belongs_to :winner, class_name: "Player", inverse_of: :matches_won, optional: true
  belongs_to :loser,  class_name: "Player", inverse_of: :matches_lost, optional: true

  validates :winner, presence: true, on: :create
  validates :loser,  presence: true, on: :create

  validate :winner_and_loser_must_differ
  after_create :increment_player_counts

  private

  def winner_and_loser_must_differ
    return if winner_id.blank? || loser_id.blank?

    errors.add(:base, "Winner and loser must be different players") if winner_id == loser_id
  end

  def increment_player_counts
    winner.increment!(:matches_won_count)
    loser.increment!(:matches_lost_count)
  end
end
