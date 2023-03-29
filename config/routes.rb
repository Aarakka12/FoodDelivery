Rails.application.routes.draw do



















































  
  get "/admin" => "administrator#show", as: :dashboard
  get "admin/foods" => "administrator#food_index", as: :admin_foods
  get "admin/orders" => "administrator#order_index", as: :admin_orders
  get "admin/users" => "administrator#user_index", as: :admin_users
  get "admin/sales" => "administrator#sale_index", as: :admin_sales
  get "admin/categories" => "administrator#category_index", as: :admin_categories

  get "sales/new"
  
  resources :categories
  resources :administrator
  resources :cart_items
  resources :carts
  resources :sales
  resources :users do
    resources :orders
  end
  resources :foods do
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
