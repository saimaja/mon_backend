class TravelogueSerializer < ActiveModel::Serializer
    attributes :title, :blog, :user_id
end