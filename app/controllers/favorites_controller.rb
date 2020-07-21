class FavoritesController < ApplicationController

    def index
        render json: Favorite.all.to_json(:except => [:created_at, :updated_at])
    end

    def create
        favorite = Favorite.create_or_find_by(favParams)
        render json: favorite
    end

    def destroy
        render json: Favorite.destroy(params[:id])
    end


    private
    def favParams
        params.require(:favorite).permit(:monument_id, :user_id)
    end
end
