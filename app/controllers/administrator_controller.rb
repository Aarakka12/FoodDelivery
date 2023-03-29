class AdministratorController < ApplicationController
    def show
      @orders = Order.all.paginate(page: params[:page], per_page: 10)
      render 'administrator/orders'
    end
  
    def food_index
      @foods = Food.all.order(created_at: :desc)
      render 'administrator/foods'
    end
  
    def order_index
      @orders = Order.all.paginate(page: params[:page], per_page: 10)
      render 'administrator/orders'
    end
  
    def user_index
      @users = User.all.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
      render 'administrator/users'
    end
  
    def category_index
      @categories = Category.all.paginate(page: params[:page], per_page: 10)
      render 'administrator/categories'
    end
  
    def sale_index
      @items = []
      Food.all.each do |food|
        @items << food if food.sales[:status]
      end
      render 'administrator/sales'
    end
  
    def update
      @title = "orders"
      @orders = Order.all.paginate(page: params[:page], per_page: 10)
      @status = params["order"]["Status"]
      @order_id = params["order_id"]
      @order = Order.find(@order_id)
      @order.update(Status: @status)
      StatusWorker.perform_async(@order_id)
      redirect_to dashboard_path
    end
end
  