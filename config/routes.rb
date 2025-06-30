Rails.application.routes.draw do
  devise_for :users
  root to: 'stories#index'
  resources :stories, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end