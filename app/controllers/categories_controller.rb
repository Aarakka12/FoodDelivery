class CategoriesController < ApplicationController
        before_action :set_category, only: [:edit, :update, :show, :destroy]
    
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = category.new(category_params)
        if @category.save
            redirect_to categories_path, notice: 'Category has been created successfully'
        else
            render :new
        end
    end

    def edit
        
    end

    def update
       
        if @category.update(category_params)
            redirect_to categories_path, notice: 'Category has been updated successfully'
        else
            render :edit
        end
    end

    def show
        
    end

    def destroy
        if @category.destroy
            redirect_to categories_path, notice: 'Category has been deleted successfully'
        end
    end

    private
        def category_params
            params.require(:category).permit(:title, :description) 
        end

        def set_category
            @category = Category.find(params[:id])
        rescue ActiveRecord::RecordNotFound => error
            redirect_to categories_path, notice: error

        end
    
end
