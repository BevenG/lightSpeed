class AddDetailsToStarships < ActiveRecord::Migration[7.1]
  def change
    add_column :starships, :description, :text
    add_column :starships, :weapons, :string
    add_column :starships, :upgrades, :string
  end
end
