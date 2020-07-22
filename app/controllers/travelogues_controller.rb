class TraveloguesController < ApplicationController

    def index
        render json: Travelogue.all.to_json
    end

    def show
        render json: Travelogue.find(params[:id]).to_json(:include => :monuments)
    end

end
