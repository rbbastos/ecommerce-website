# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages

  get '/static/:permalink', to: 'pages#permalink', as: 'permalink'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get 'categories/index'
  resources :categories, only: %i[index show]

  resources :deals, only: :show
  # get 'deals/show'

  # get 'products/index'
  # get 'products/show'
  resources :products, only: %i[index show] do
    collection do
      get 'search_results'
    end
    collection do
      get 'shopping_cart'
    end
  end

  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'

  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'

  # get 'provinces/index'
  resources :provinces, only: :index

  # get 'customers/index'
  # get 'customers/show'
  resources :customers, only: %i[index show]

  # get 'orders/index'
  # get 'orders/show'
  resources :orders, only: %i[index show]
  get '/review_order', to: 'orders#review_order', as: 'review_order'
  get '/order_final', to: 'orders#order_final', as: 'order_final'

  # get 'payments/index'
  # get 'payments/show'
  resources :payments, only: %i[index show]

  # get 'line_items/index'
  resources :line_items

  resource :cart, only: [:show]
  post '/cart', to: 'line_items#create', as: 'update_qty'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'
end
