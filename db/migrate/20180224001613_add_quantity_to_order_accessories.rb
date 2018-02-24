class AddQuantityToOrderAccessories < ActiveRecord::Migration[5.1]
  def change
    add_column :order_accessories, :quantity, :integer
  end
end
