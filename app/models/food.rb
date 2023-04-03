class Food < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  has_one_attached :image
  belongs_to :restaurant
  has_many :menu_items

end
