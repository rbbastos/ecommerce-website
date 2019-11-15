# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get 'categories/index'
  resources :categories, only: %i[index show]

  # get 'products/index'
  # get 'products/show'
  resources :products, only: %i[index show] do
    collection do
      get 'search_results'
    end
  end

  # get 'provinces/index'
  resources :provinces, only: :index

  # get 'customers/index'
  # get 'customers/show'
  resources :customers, only: %i[index show]

  # get 'orders/index'
  # get 'orders/show'
  resources :orders, only: %i[index show]

  # get 'payments/index'
  # get 'payments/show'
  resources :payments, only: %i[index show]

  # get 'line_items/index'
  resources :line_items, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'
end
