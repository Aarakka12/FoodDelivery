ActiveAdmin.register Restaurant do

  # has_many :admin_users

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  scope_to :current_admin_user

  # controller do 
  #   def current_admin_user
  #       current_admin_user   
  #   end
  # end

  permit_params :name, :address, :phone
   
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :opening_time, :closing_time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
