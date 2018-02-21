class Accessory < ApplicationRecord
  validates_presence_of :name, :description, :price

end
