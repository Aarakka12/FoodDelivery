Rails.application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get "home", to: 'home#index'
  
  root to: 'home#index'
  get 'password', to: 'passwords#edit'
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: "users#create"

  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  
  put "account", to: "users#update"
  get "account", to: "users#show"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"


  resources :categories, only: :index
  resources :restaurants, only: [:index] do
    resources :foods, only: [:index, :show]
  end

  # resources :order_items, only: [:index, :create, :destory]
  get "new_order_item", to: "order_items#new"
  resources :orders 
  resources :order_items

  resources :carts do
    member do
      post :checkout_items
    end
  end
  resources :cart_items
  # resources :checkouts 
  resources :admin_users, only: [:index]

  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token
  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end

  resources :payments
  get 'account/orders', to: 'users#orders', as: 'user_orders'
  # post '/carts', to: 'carts#create', as: 'add_to_cart'
 
  # get '/orders/:id/items', to: 'orders#items', as: 'order_items'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end