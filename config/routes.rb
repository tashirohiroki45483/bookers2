Rails.application.routes.draw do

  resources :books, only: [:new, :index, :show, :create, :destroy]
  devise_for :users
  get "/users"  => "users#index"
  root to: "homes#top"
  get "home/about"  => "homes#about"
end
