class Order < ApplicationRecord

  validates_presence_of :total, :status, :submitted

  belongs_to :user
  belongs_to :accessory

end
