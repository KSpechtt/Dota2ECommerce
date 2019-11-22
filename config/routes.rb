# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'items/add_to_cart/:id', to: 'items#add_to_cart', as: 'add_to_cart'
  delete 'items/remove_from_cart/:id', to: 'items#remove_from_cart', as: 'remove_from_cart'

  resources :items, only: %i[index show] do
    collection do
      get 'search_results'
      get 'filter_results'
      get 'cart'
    end
  end
  resources :about
  resources :contact
  resources :categories, only: %i[index show]
  root to: 'pages#home'
end
