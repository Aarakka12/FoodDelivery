class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :customer_name
      t.string :customer_address
      t.string :customer_phone
      t.string :status
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
