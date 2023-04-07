class FoodsController < ApplicationController
    
    before_action :authenticate_user!

    def index
        @foods =Food.all
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        @categories = Category.all
        
        if params[:category]
            @foods = @restaurant.foods.where(category_id:params[:category])
        else
            @foods = @restaurant.foods
        end
       
        @cart = current_user.cart
        
    end

    def authorize_restaurant!
        food = Food.find(params[:id]) 
        if current_admin_user.restaurant_id != food.restaurant_id
            flash[:error] = "You are not authorized to access"
            redirect_to root_path
        end       
    end
    

end
