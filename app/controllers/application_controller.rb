class ApplicationController < ActionController::API
  include ActionController::Cookies

  private
  
  def require_login
    unless logged_in?
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end

  def logged_in?
    session[:user_id].present?
  end

end
