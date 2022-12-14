class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
  end


  # GET /categories/new
  def new
    @category = Category.new
  end

  # # GET /categories/1/edit
  def edit
  end

  # # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

      if @category.save
        flash[:notice]= "Category was successfully saved"
        redirect_to @category
      else
      render 'new'
      end
    end



    def update
      # @article=Article.find(params[:id])
     if @category.update(category_params)
      flash[:notice]="category was successfully updated !" 
      redirect_to @category       #show page
     else
      render 'edit'
     end
  end


  # # DELETE /categories/1 or /categories/1.json
  # def destroy
  #   @category.destroy

  #   respond_to do |format|
  #     format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
