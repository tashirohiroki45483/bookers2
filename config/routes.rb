Rails.application.routes.draw do

  resources :books, only: [:new, :index, :show]
  devise_for :users
  root to: "homes#top"
end
