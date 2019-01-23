class User < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :pets, through: :matches
end
