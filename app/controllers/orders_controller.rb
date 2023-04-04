class OrdersController < ApplicationController
  

  def new
    @order_items = current_order.order_items.new
    
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order)
    else 
      render :new
    end    
  end
  
  def show
    @order_items = current_order.order_items
  end

  def index
    @orders = Order.all    
  end

  def edit
    @order = Order.find(params[:id])    
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params) 
      redirect_to order_path
    else
      render :edit  
    end   
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy 
    redirect_to orders_path   
  end
  
  private 
  def order_params
    params.require(:order).permit(:customer_name, :customer_address, :customer_phone, :status, :restaurant_id)    
  end

end
