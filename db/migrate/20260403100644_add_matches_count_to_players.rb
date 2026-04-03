class AddMatchesCountToPlayers < ActiveRecord::Migration[8.1]
  def change
    add_column :players, :matches_won_count, :integer, default: 0, null: false
    add_column :players, :matches_lost_count, :integer, default: 0, null: false
  end
end
