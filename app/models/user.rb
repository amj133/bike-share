class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username
  validates_uniqueness_of :username

  has_many :orders

  enum role: ["default", "admin"]

  def shipping_info
    [first_name, last_name, street, city, state, zipcode]
  end
end
