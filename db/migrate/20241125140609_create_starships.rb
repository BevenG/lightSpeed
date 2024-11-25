class CreateStarships < ActiveRecord::Migration[7.1]
  def change
    create_table :starships do |t|
      t.integer :price
      t.integer :mass
      t.integer :top_speed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
