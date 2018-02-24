class Accessory < ApplicationRecord
  validates_presence_of :name, :description, :price

  has_many :order_accessories
  has_many :orders, through: :order_accessories

end
