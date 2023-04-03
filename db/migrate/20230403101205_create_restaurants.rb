class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :opening_time
      t.integer :closing_time

      t.timestamps
    end
  end
end
