class AddAddressToStarship < ActiveRecord::Migration[7.1]
  def change
    add_column :starships, :address, :string
  end
end
