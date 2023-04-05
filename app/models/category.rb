class Category < ApplicationRecord
    has_many :foods
    has_many :menu_items
end
