module ApplicationHelper
    #since helper methods are only available to views we have to add 
    #them at controller level to make them accessible to controllers
    # as well
    def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end
end
