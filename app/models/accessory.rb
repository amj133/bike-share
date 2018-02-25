class Accessory < ApplicationRecord
  validates_presence_of :name, :description, :price
  validates_uniqueness_of :name

  has_many :order_accessories
  has_many :orders, through: :order_accessories

end
