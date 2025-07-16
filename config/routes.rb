Rails.application.routes.draw do
  devise_for :users
  root to: 'stories#index'
  resources :stories do
    resources :comments, only: [:create, :destroy]
    resources :reactions, only: [:create]
    collection do
      get :drafts
    end
  end
  resources :users, only: [:show, :edit, :update] do
    member do
      get :bookmarks
      get :follow
      patch :withdraw
    end
  end

  resources :categories, only: [:show]
  resources :genres, only: [:show]
  resources :relationships, only: [:create, :destroy]
  resources :bookmarks, only: [:create, :destroy]
end