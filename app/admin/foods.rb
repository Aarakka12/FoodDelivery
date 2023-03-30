ActiveAdmin.register Food do
  
  permit_params :name, :description, :price, :status, :category_id, :prep_time

end
