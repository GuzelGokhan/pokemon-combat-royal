class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :decks, :start, :start_date
    rename_column :decks, :end, :end_date
  end
end
