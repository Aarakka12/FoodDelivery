class FoodsController < ApplicationController
    
    def index
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        @categories = Category.all
        # @category = Category.find_by_id(params[:category])
        # byebug
        if params[:category]
            @foods =@restaurant.foods.where(category_id:params[:category])
        else
            @foods = @restaurant.foods
        end
    end

end
