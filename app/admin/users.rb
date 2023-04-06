ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :first_name, :last_name, :email, :password_digest, :confirmed_at, :unconfirmed_email, :role
  #
  # or
  #
  permit_params do
    permitted = [:first_name, :last_name, :email, :password_digest, :confirmed_at, :unconfirmed_email, :role]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
  
end
