class OrdersController < ApplicationController

  def show
    @order_items = current_order.order_items
  end

  def current_order
    if Order.find_by_id(session[:order_id]).nil?
      Order.new
    else
      Order.find_by_id(session[:order_id])
    end
  end

end
