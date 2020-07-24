class TraveloguesController < ApplicationController

    def index
        render json: Travelogue.all.to_json(:include => :mon_travels)
    end

    def show
        render json: Travelogue.find(params[:id]).to_json(:include => :mon_travels)
    end

end
