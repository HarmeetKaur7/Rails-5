class UsersController < ApplicationController

    before_action :find_user ,only: [:show,:edit,:update]
    before_action :require_user, except: [:show,:index]  #order matters here
   before_action :require_same_user, only: [:edit,:update] # checking logged in user and then same user condition

    def index
        @users=User.all
    end

    def new
        @user=User.new
    end

    def edit
        
    end

    def show
        @articles=@user.articles
    end

    def create
        @user=User.new(params_user)
        if @user.save
            session[:user_id]=@user.id
            flash[:notice] = "Welcome #{@user.username}, You have successfully signedup !"
            redirect_to users_path
        else
            render 'new'   
        end 
    end

    def update
        if @user.update(params_user)
            flash[:notice] = "Hi #{@user.username}, Your account has been updated !"
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    private
    def find_user
        @user=User.find(params[:id])
    end
    def params_user
        params.require(:user).permit(:username,:email,:password)
    end


    def require_same_user
        if current_user!=@user
            flash[:alert]="You can only edit your account" 
            redirect_to user_path(@user)
        end
    end
end
