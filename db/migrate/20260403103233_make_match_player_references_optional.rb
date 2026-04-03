class MakeMatchPlayerReferencesOptional < ActiveRecord::Migration[8.1]
  def change
    change_column_null :matches, :winner_id, true
    change_column_null :matches, :loser_id, true

    remove_foreign_key :matches, column: :winner_id
    add_foreign_key :matches, :players, column: :winner_id, on_delete: :nullify

    remove_foreign_key :matches, column: :loser_id
    add_foreign_key :matches, :players, column: :loser_id, on_delete: :nullify
  end
end
