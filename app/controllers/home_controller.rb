class HomeController < ApplicationController
    def restaurant_index     
    
    end

    def customer_index
        
    end

    def show
        @user = User.find(params[:id])
    end
    
end
