class User < ApplicationRecord
    has_many :travelogues
    has_many :favorites
    has_many :monuments, through: :favorites

end
