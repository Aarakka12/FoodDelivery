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

    def after_login_path_for
        if @user.role == "Restaurant"
            home_restaurant_index_path
        elsif @user.role == "Customer"
            home_customer_index_path
        else
            root_path
        end
    end

    def main_page
        @disable_nav = true
    end
end
