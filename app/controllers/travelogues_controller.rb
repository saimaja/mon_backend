class TraveloguesController < ApplicationController

    def index
        render json: Travelogue.all.to_json(:include => :mon_travels)
    end

    def show
        render json: Travelogue.find(params[:id]).to_json(:include => :user)
    end

    def create 
        travelogue = Travelogue.create_or_find_by(title: params[:title], blog: params[:blog], user_id: params[:user_id], monument_ids: params[:monument_ids])
        
        render json: travelogue.to_json(:include => :mon_travels)
    end

    def update
        travelogue = Travelogue.find(params[:id])
        travelogue.update(travelogueParams)
        render json: travelogue
    end

    def destroy
        render json: Travelogue.destroy(params[:id])
    end



    private
    def travelogueParams
        params.require(:travelogue).permit(:blog, :user_id, :title, monument_ids: [])
    end


end
