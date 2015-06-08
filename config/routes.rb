Rails.application.routes.draw do
  resources :entries

  root to: 'visitors#index'
  devise_for :users
  resources :entries, only: [:new, :edit, :create, :uptade, :destroy]

  resources :users do
    resources :entries, only: [:show]
  end
end
