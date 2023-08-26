class ApplicationController < ActionController::API
  include ActionController::Cookies


  # before_action :set_current_user

  # helper_method :logged_in?, :current_user

  # private

  # def user_params
  #   params.require(:user).permit(:username, :password, :image_url, :bio)
  # end

  # def logged_in?
  #   session[:user_id].present?
  # end

  # def set_current_user
  #   @current_user = User.find_by(id: session[:user_id]) if logged_in?
  # end

  # def current_user
  #   @current_user
  # end
end
