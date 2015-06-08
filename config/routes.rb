Rails.application.routes.draw do
  resources :entries

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
