class User < ApplicationRecord
  has_secure_password
  validates :email, email_format: {message: 'invalid'}
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  has_many :orders

  enum role: ["default", "admin"]

  def shipping_info
    [first_name, last_name, street, city, state, zipcode]
  end
end
