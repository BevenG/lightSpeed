class AddNameToStarships < ActiveRecord::Migration[7.1]
  def change
    add_column :starships, :name, :string
  end
end
