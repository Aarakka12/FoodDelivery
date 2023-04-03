class OrdersController < ApplicationController

  def show
    @order_items = current_order.order_items
  end

  def self.current_order
    if session[:order_id]
      @current_order ||= order.find(session[:order_id])
    end

    if session[:order_id].nil?
      @current_order = order.create!
      session[:order_id] = @current_order.id
    end
    
    @current_order
  end 

end
