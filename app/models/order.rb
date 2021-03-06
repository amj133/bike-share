class Order < ApplicationRecord

  validates_presence_of :total, :status, :submitted

  belongs_to :user
  has_many :order_accessories
  has_many :accessories, through: :order_accessories

  def self.by_status(status)
    where(status: status)
  end
end
