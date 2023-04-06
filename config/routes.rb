Rails.application.routes.draw do
  
  root to: 'main#index'
  # get 'restaurants/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get "home", to: 'home#index'
  
  # get "root", to: "main#index"
  get 'password', to: 'passwords#edit'
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: "users#create"

  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "login", to: "sessions#new"
  
  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"


  # get "customer_index", to: "home#cutomer_index"

  resources :categories, only: :index
  resources :restaurants, only: [:index] do
    resources :foods, only: [:index, :show]
  end
  
  resources :order_items
  resources :orders
  resources :admin_users, only: [:index]
  resources :menu_items, only: [:index]
  
  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token
  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
