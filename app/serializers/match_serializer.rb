class MatchSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :pet
  attributes :id, :user_id, :pet_id
end
