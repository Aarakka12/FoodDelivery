class ApplicationController < ActionController::Base
    include Authentication
    before_action :set_current_user
    
    def set_current_user
        if session[:user_id]
            Current.user = User.find(session[:user_id])
        end   
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must be sign in to do that." if Current.user.nil?        
    end

    def current_order
        if Order.find_by_id(session[:order_id]).nil?
          Order.new
        else
          Order.find_by_id(session[:order_id])
        end
    end
    
   
end
