class OrderItem < ApplicationRecord

    belongs_to :food
    belongs_to :order
    belongs_to :user

    before_save :set_unit_price
    before_save :set_total
  
    def unit_price
      if persisted?
        self[:unit_price]
      else
        food.price
      end
    end
  
    def total_price
      # unit_price * quantity
      # order_items.sum(&total_price)
    end
  
    private
  
    def set_unit_price
      self[:unit_price] = unit_price
    end
  
    def set_total
      self[:total] = total * quantity
    end

end
