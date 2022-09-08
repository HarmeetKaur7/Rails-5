class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
   if session[:user_id]
    @current_user ||= User.find(1) #session[:user_id]
    end
  end

    def logged_in?
        !!current_user
    end

    def require_user
      if !logged_in?
        flash[:alert]= "You must be logged in to perform that action ! "
        redirect_to login_path
      end
    end
end
