class PetSerializer < ActiveModel::Serializer
  has_many :matches
  has_many :users, through: :matches
  has_one :owner, :class_name => "User"
  attributes :id, :name, :age, :sex, :size, :breed, :animal, :description, :shelterId, :photo, :adopted, :owner_id
end
