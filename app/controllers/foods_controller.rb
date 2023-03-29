class FoodsController < ApplicationController
    # before_action :check_if_admin, only: [:create, :destroy, :update, :edit_status]
  
    def index
      @foods = Food.all.order(created_at: :asc)
    end
  
    def new
      @food = Food.new
    end
  
    def edit
      @food = Food.find(params[:id])
      render template: "foods/new"
    end
  
    def create
      @food = {}
      # if image
        @food = Food.create(food_params)
        flash[:success] = "#{@food.name} has been added successfully."
        redirect_to admin_foods_path
      # else
        flash[:error] = "An error occured. Try adding #{@food.name} again."
      # end
    end
  
    def show
      @food = Food.find(params[:id])
    end
  
    def update
      @food = Food.find(params[:id])
      image if food_params[:image]
      if @food
        save_food
      else
        flash[:error] = "An error occured. Try adding #{@food.name} again."
      end
    end
  
    def destroy
      food = Food.find(params[:id])
      if food
        food.destroy
        flash[:success] = "#{food.name} has been deleted."
        redirect_to dashboard_path
      else
        flash[:error] = "An error occured. Try deleting #{@food.name} again."
      end
    end
  
    def edit_status
      food = Food.find(food_params[:id].to_i)
      unless food.nil?
        status = food_params[:status] == "true" ? "available" : "not available"
        food.status = status
        food.save
        render json: food
      end
    end
  
    private
  
    def food_params
      params.require(:food).permit(:id, :name, :description, :price, :category_id, :image, :status,:prep_time, sales: [:percentage, :price, :status, :js])
    end
  
    def save_food
      # @food[:food_image_file_name] = @food_image_url
      if food_params[:sales][:js]
        food = food_params[:sales]
        food_status = (food["status"] == "true") ? true : false
        @food.update(sales: { price: food["price"].to_f,
                              percentage: food["percentage"].to_f,
                              status: food_status })
        render json: { success: true }
      else
        @food.update(food_params)
        flash[:success] = "#{@food.name} has been updated successfully."
        redirect_to foods_path
      end
    end
end
  