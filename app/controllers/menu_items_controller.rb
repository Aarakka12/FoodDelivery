class MenuItemsController < ApplicationController
    def index   
        @menu_item = MenuItem.all
        @categories = Category.all
        @foods = Food.all
    end

    def show
        @menu = Menu.find(params[:id])
        @categories = @menu.categories
    end
   
    private
        def menu_params
            params.require(:menu_item).permit(:food_id, :category_id)         
        end
    
end
