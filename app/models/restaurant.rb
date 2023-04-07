class Restaurant < ApplicationRecord
    belongs_to :admin_user
    has_many :foods

    # def self.with_admin_user(restaurant)
    #     where(admin_user_id: restaurant.id)        
    # end
    
end
