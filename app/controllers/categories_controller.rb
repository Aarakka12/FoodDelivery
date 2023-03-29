class CategoriesController < ApplicationController
  before_action :check_category, only: [:edit, :update, :show, :destroy]

  def index
    @categories = Category.all
    render "/categories/index"
  end

  def new
    @category = Category.new
  end

  def create

      @category = Category.create(category_params)
      if @category
        flash[:success] = "New category Created"
        redirect_to dashboard_path
      else
        flash[:failure] = "Error in creating category"
      end

  end

  def edit
    @category = Category.find(params[:id])
    render "categories/new"
  end

  def show
    @category = Category.find(params[:id])
    render 'foods/index'
  end

  def update
    @category = Category.find(params[:id])
    if @category.update
        redirect_to admin_categories_path, notice: 'Category has been updated successfully'
    else
        render :edit
    end
  end

  def destroy
      @category = Category.find(params[:id])
      if @category.destroy
          redirect_to admin_categories_path, notice: 'Category has been deleted successfully'
      end
  end
  
  private
      def category_params
        params.require(:category).permit(:title, :description)
      end


      def check_category
          @category = Category.find(params[:id])
      end
end
