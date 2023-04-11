class Order < ApplicationRecord
  
    has_many :order_items
    has_many :cart_items, dependent: :destroy
    has_many :foods, through: :cart_items
    belongs_to :user
    belongs_to :restaurant
    belongs_to :address, optional: true

    before_validation :set_address
 
    accepts_nested_attributes_for :foods
    
    after_create :create_payment
    
    validates :restaurant_id, presence: true
    validates :default_address_id, presence: true

    def create_payment
        payement = Payment.new(order: self, user: user)
        payment.unpaid!
    end
    
  
    private
  
    def set_address
        self.address ||= user.default_address
    end
    
   
end
