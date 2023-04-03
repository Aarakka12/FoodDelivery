class RemoveSalesFromFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods, :sales
  end
end
