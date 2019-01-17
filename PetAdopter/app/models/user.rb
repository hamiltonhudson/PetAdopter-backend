class User < ApplicationRecord
  has_many :matches
  has_many :pets, through: :matches
end
