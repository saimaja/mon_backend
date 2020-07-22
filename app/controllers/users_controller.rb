class UsersController < ApplicationController

    def index
        render json: User.all.to_json(:except => [:password, :created_at, :updated_at])
    end

    def create
        user = User.create_or_find_by(registerParams)
        user.update(admin: false)
        render json: user.to_json(:except => :password)
    end

    def login
        user = User.find_by(loginParams)
        if user
            render json: user.to_json(:except => :password)
        else
            render json: {error: true, message: "Incorrect username or password!"}
        end
    end

    def show
        user = User.find(params[:id])
        render json: user.to_json(:except => [:password, :created_at, :updated_at], :include => [:favorites, :travelogues, :monuments])
    end
    
    def update
    end

    def destroy
    end

    private

    def loginParams
        params.require(:user).permit(:username, :password)
    end

    def registerParams
        params.permit(:name, :username, :password, :bio)
    end

end

