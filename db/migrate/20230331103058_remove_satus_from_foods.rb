class RemoveSatusFromFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods, :status
  end
end
