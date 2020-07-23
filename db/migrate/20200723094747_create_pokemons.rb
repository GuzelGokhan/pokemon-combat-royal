class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :location
      t.string :element
      t.integer :life
      t.integer :attack
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
