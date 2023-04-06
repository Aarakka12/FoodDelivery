class ChangeMenuItemToFoods < ActiveRecord::Migration[6.1]
  def change
    rename_table :menu_item, :foods
  end
end
