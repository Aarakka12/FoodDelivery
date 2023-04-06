class RemoveOpeningTimeFromRestaurants < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :opening_time
    remove_column :restaurants, :closing_time
  end
end
