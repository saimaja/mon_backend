class MonumentsController < ApplicationController

    def index
        render json: Monument.all.to_json(:except => [ :created_at, :updated_at])
    end

    # def show
    #     render json: Monument.find(params[:id]).to_json(:except => [ :created_at, :updated_at ], :include => [:category, :orders])
    # end
end
