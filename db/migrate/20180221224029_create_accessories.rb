class CreateAccessories < ActiveRecord::Migration[5.1]
  def change
    create_table :accessories do |t|
      t.string :name
      t.text :description
      t.integer :price
    end
  end
end
