class PetSerializer < ActiveModel::Serializer
  has_many :matches
  has_many :users, through: :matches
  attributes :id, :name, :age, :sex, :size, :breed, :animal, :description, :shelterId, :photo
end
