class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :username, :password, :bio, :admin, :mon_travels
end