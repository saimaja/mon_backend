class Travelogue < ApplicationRecord
    belongs_to :user
    has_many :montravels
    has_many :monuments, through: :montravels
end
