class Pet < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_many :users, through: :matches
  has_one :owner, :class_name => "User"
end
