class AddImagePathToAccessories < ActiveRecord::Migration[5.1]
  def change
    add_column :accessories, :image_path, :string
  end
end
