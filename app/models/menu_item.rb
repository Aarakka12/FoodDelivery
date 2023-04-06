class MenuItem < ApplicationRecord
  belongs_to :category
  belongs_to :food
end
