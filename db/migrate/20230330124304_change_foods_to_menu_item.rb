class ChangeFoodsToMenuItem < ActiveRecord::Migration[6.1]
  def change
    rename_table :foods, :menu_item
  end
end
