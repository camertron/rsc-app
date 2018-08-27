class User < ApplicationRecord
  has_secure_password
  has_many :programs

  validates :email, uniqueness: true
  validates :login, uniqueness: true
end
