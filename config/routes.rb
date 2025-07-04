Rails.application.routes.draw do
  devise_for :users
  root to: 'stories#index'
  resources :stories do
    resources :comments, only: [:create, :destroy]
    resources :reactions, only: [:create]
  end
  resources :users, only: [:show, :edit, :update]
  resources :categories, only: [:show]
  resources :genres, only: [:show]
  resources :relationships, only: [:create, :destroy]
end