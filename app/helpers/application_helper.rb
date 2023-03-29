module ApplicationHelper
    def this_food_in_cart(food)
        food_count = 0
        if !session.nil? && !session[:cart].nil?
            food_count = session[:cart][food.id.to_s].nil? ? 0 : session[:cart][food.id.to_s]
        end
    end

    def admin?
        if !user_signed_in?
         current_user.role == "admin"
        end
    end

    def check_if_admin
        if admin?
          true
        else 
          redirect_to root_path
          flash[:danger] = "You do not have access to the Admin page"
        end
    end


end
