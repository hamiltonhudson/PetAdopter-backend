class User < ApplicationRecord
  has_secure_password
  has_many :matches, dependent: :destroy
  has_many :pets, through: :matches
  validates :username, uniqueness: { case_sensitive: false }
  # validates :username, presence: true, uniqueness: true
  # validates :password, presence: true
end
