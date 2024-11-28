class AddImageUrlToStarships < ActiveRecord::Migration[7.1]
  def change
    add_column :starships, :image_url, :string
  end
end
