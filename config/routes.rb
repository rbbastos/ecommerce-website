# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'categories/index'
  resources :categories, only: %i[index show]

  # get 'products/index'
  # get 'products/show'
  resources :products, only: %i[index show]

  # get 'provinces/index'
  resources :provinces, only: :index

  # get 'customers/index'
  # get 'customers/show'
  resources :customers, only: %i[index show]

  # get 'orders/index'
  # get 'orders/show'
  resources :orders, only: %i[index show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'products#index'
end
