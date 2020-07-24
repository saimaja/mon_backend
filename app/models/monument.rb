class Monument < ApplicationRecord
    has_many :favorites
    has_many :mon_travels
    has_many :users, through: :favorites
    has_many :travelogues, through: :mon_travels

    def parseString(str)
        str.to_i
    end


end
