class TraveloguesController < ApplicationController

    def index
        render json: Travelogue.all.to_json(:include => :mon_travels)
    end

    def show
        render json: Travelogue.find(params[:id]).to_json(:include => :user)
    end

    def create 
        travelogue = Travelogue.create_or_find_by(travelogueParams)
        render json: travelogue
    end

    def destroy
        render json: Travelogue.destroy(params[:id])
    end



    private
    def travelogueParams
        params.require(:travelogue).permit(:blog, :user_id, :title)
    end


end
