class MonumentsController < ApplicationController

    def index
        render json: Monument.all.to_json(:except => [:created_at, :updated_at])
    end

    def map
        render json: Monument.all.to_json(:except => [ :created_at, :updated_at])
    end

    def about
    end

    def show
        render json: Monument.find(params[:id]).to_json(:include => [:mon_travels, :travelogues])
    end


end
