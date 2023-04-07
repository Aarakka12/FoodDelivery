require_relative "categories_controller"

class MenuItemsController < ApplicationController
    def index   
        puts "################"
        puts menu_params[:food_id]  
        puts"##################"
        @category = Category.find(params[:id])
        @menu_items = MenuItem.where(category_id: @category.id)
        # @menu_item = @category.menu_item.find(params[:id])
        # @menu_item = MenuItem.find(params[:id])
        # @categories = @menu.categories
    #    @category = Category.find(params[:category_id])
    #    @menu_items = @Category.menu_items
    end

    def show
        @menu = Menu.find(params[:id])
        @categories = @menu.categories
    end
   
    private
        def menu_params
            params.require(:menu_items).permit(:food_id, :category_id)   
        end
end
