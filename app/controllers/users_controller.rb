class UsersController < ApplicationController

    before_action :set_current_user, only: [:create, :show]
    before_action :require_login, only: [:show]

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        if logged_in?
            render json: current_user
        else
            render json: { error: "Unauthorized" }, status: :unauthorized
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username, :password, :image_url, :bio)
    end

    def set_current_user
        @current_user = User.find_by(id: session[:user_id]) if logged_in?
    end

    def logged_in?
        session[:user_id].present?
    end
end


