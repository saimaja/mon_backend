class Travelogue < ApplicationRecord
    belongs_to :user
    has_many :mon_travels
    has_many :monuments, through: :mon_travels
end
