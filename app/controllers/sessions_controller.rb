class SessionsController < ApplicationController

    def new
    end

    def create

        user= User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id]=user.id
            flash[:notice]="login Successful #{user.username} ! "
            redirect_to user_path(user)
        else
            flash.now[:alert]= "Wrong Credentials  !" #doesnt wait for one full request cycle
            render 'new'
        end
    end

    def destroy
        session[:user_id]=nil
        flash[:notice]="logged out  ! "
        redirect_to root_path
    end

end