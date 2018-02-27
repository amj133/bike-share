class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username, :password, on: :update, allow_blank: true
  validates_uniqueness_of :username

  has_many :orders

  enum role: ["default", "admin"]

end
