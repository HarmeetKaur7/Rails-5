class UsersController < ApplicationController
    def new
        @user=User.new
    end

    def create
        @user=User.new(params_user)
        if @user.save
            flash[:notice] = "Welcome #{@user.username}, You have successfully signedup !"
            redirect_to articles_path
        else
            render 'new'   
        end 
    end

    private
    def find_user
        @user=User.find(params[:id])
    end
    def params_user
        params.require(:user).permit(:username,:email,:password)
    end

end
