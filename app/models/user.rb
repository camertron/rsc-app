class User < ApplicationRecord
  has_secure_password
  has_many :programs

  validates :email, uniqueness: true, presence: true, allow_blank: false
  validates :login, uniqueness: true, presence: true, allow_blank: false
end
