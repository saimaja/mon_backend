class Monument < ApplicationRecord
    has_many :favorites
    has_many :montravels
    has_many :users, through: :favorites
    has_many :travelogues, through: :montravels

    def parseString(str)
        str.to_i
    end


end
