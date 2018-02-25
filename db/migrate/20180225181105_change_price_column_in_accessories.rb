class ChangePriceColumnInAccessories < ActiveRecord::Migration[5.1]
  def change
    change_column :accessories, :price, :decimal
  end
end
