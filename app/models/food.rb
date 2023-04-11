class Food < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :carts, through: :cart_items
  has_one_attached :image
  belongs_to :restaurant
  # has_many :menu_items
  has_many :cart_items

  def self.for_restaurant(restaurant_id)
    where(restaurant_id: restaurant_id)    
  end
  
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

    def create(cart)
      if quantity > 0
        cart_item = cart.cart_items.find_by(food_id: id)
        if cart_item
          cart_item.update(quantity: cart_item.quantity + 1)
        else
          cart_item = cart.cart_items.create(food: self, quantity: 1)
        end
        update(quantity: quantity - 1)
        cart_item
      else
        cart_item = nil
        errors.add(:base, "Sorry, this item is out of stock")
      end
    end

end
