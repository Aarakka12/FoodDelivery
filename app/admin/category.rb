ActiveAdmin.register Category do
  
  permit_params :title, :description

  action_item :foods, only: [:create, :show] do
    link_to 'Add Foods', "new_admin_food_path(category)"
  end

end
