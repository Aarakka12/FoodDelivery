# require_relative "orders_controller.rb"
class OrderItemsController < ApplicationController

  include OrdersHelper

    before_action :set_order
    
    def create
      # byebug
      @order_item = @order.order_items.new(order_item_params)
      @order.save
      session[:order_id] = @order.id
    end
    
    def index
      # @order_items = OrderItem.where(order_id: @order.id)
      @order_items = OrderItem.all
    end

    def update
        @order_item = @order.order_items.find(params[:id])
        @order_item.update_attributes(order_params)
        @order_items = current_order.order_items
    end
      
    def destroy
        @order_item = @order.order_items.find(params[:id])
        @order_item.destroy
        @order_items = current_order.order_items
    end
      
    private
      
        def order_item_params
          params.permit(:food_id, :quantity)
        end
      
        def set_order
          @order = current_order
        end
      
end
