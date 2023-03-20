Rails.application.routes.draw do

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update]
  devise_for :users
  resources :users, only: [:index, :show, :edit, :create, :update]
  
  root to: "homes#top"
  get "home/about"  => "homes#about"
end
