Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :messages, only:[:index]
  resources :groups, only:[:index, :new, :edit, :create, :update]
end
