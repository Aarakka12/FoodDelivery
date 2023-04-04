ActiveAdmin.register Food do
  
  permit_params [:name, :description, :price, :image, :category_id, :restaurant_id]

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :category
      f.input :restaurant
      # f.input :prep_time
      f.input :image, as: :file
    end
    f.actions
  end

  index do 
    selectable_column
    id_column
    column :name 
    column :description
    column :price
    column :category
    column :restaurant    
    # column :prep_time
    column :image do |food|
      if food.image.attached?
        image_tag food.image.variant(resize: "100*100")
      else
        content_tag(:span, "No Image")
      end
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :category
      row :restaurant
      row :image do |food|
        if food.image.attached?
          image_tag food.image.variant(resize: "400*400")
        else
          content_tag(:span, "No Image")
        end
      end
    end
  end
end