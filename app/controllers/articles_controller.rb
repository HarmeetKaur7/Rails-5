class ArticlesController < ApplicationController
before_action :find_article, only: [:show,:edit,:update,:destroy]
before_action :require_user, except: [:show,:index]  #order matters here
before_action :require_same_user, only: [:edit,:update,:destroy] # checking logged in user and then same user condition
    def show
        # @article=Article.find(params[:id])
    end
    

    def index
        @articles=Article.all
    end

    def new
        @article=Article.new
    end

    def edit 
        # @article=Article.find(params[:id])
    end
   
       #Article.update_all(user_id: User.first.id)

    def create
        @article= Article.new(params_article)
        @article.user=current_user    #from helper methods in appcontroller
        if @article.save              #so that articles are saved by logged in user and not hardcoded
            flash[:notice]="Article was successfully saved !"
            redirect_to article_path(@article)   #show page
        else
            render 'new'
        end
        #for rendering on show articles/:id
        # render plain: @article.inspect
        # @article= Article.new(params[:article] Strong parameters for security
    end

    
    def update
        # @article=Article.find(params[:id])
       if @article.update(params_article)
        flash[:notice]="Article was successfully updated !" 
        redirect_to article_path(@article)       #show page
       else
        render 'edit'
       end
    end 

    def destroy
        # @article=Article.find(params[:id])
        @article.destroy
        redirect_to articles_path                #index page
    end

    private
    def find_article
        @article=Article.find(params[:id])
    end

    def params_article
        params.require(:article).permit(:title,:description)
    end

    def require_same_user
        if current_user!=@article.user
            flash[:alert]="You can only edit your articles" 
            redirect_to article_path(@article)
        end
    end
end