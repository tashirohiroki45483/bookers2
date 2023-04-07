# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update]
  devise_for :users
  resources :users, only: [:index, :show, :edit, :create, :update]

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  root to: "homes#top"
  get "home/about" => "homes#about"
end
