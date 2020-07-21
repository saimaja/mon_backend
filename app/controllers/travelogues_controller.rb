class TraveloguesController < ApplicationController

    def index
        render json: Travelogue.all.to_json(:except => [:created_at, :updated_at])
    end

    def show
        render json: Travelogue.find(params[:id]).to_json(:include => :monuments)
    end

end
