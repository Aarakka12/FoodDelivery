ActiveAdmin.register Food do
  
  permit_params [:name, :description, :price, :image, :category_id, :prep_time]

end
