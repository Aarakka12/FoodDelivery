class FoodsController < ApplicationController
    before_action :set_food, only: [:edit, :update, :show, :destroy]
    
    def index
        @foods =Food.all
    end

    def new
        @food = Food.new
    end

    def create
        @food = food.new(food_params)
        if @food.save
            redirect_to foods_path, notice: 'Food has been created successfully'
        else
            render :new
        end
    end

    def edit
        
    end

    def update
       
        if @food.update(food_params)
            redirect_to foods_path, notice: 'Food has been updated successfully'
        else
            render :edit
        end
    end

    def show
        
    end

    def destroy
        if @food.destroy
            redirect_to foods_path, notice: 'Food has been deleted successfully'
        end
    end

    private
        def food_params
            params.require(:food).permit(:name, :description, :price, :category_id, :status, :prep_time)
        end

        def set_food
            @food = Food.find(params[:id])
            rescue ActiveRecord::RecordNotFound => error
                redirect_to foods_path, notice: error

        end
    
end
