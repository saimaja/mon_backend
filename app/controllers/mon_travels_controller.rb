class MonTravelsController < ApplicationController

    def index
        render json: MonTravel.all
    end

end
