class CreateDecks < ActiveRecord::Migration[6.0]
  def change
    create_table :decks do |t|
      t.date :start
      t.date :end
      t.references :user, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
