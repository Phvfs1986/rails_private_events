# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'users/:id', to: 'users#show', as: 'user_show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events
  # Defines the root path route ("/")
  root 'events#index'
end
