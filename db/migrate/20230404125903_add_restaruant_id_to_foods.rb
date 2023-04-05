class AddRestaruantIdToFoods < ActiveRecord::Migration[6.1]
  def change
    add_reference :foods, :restaurant, foreign_key: true
  end
end
