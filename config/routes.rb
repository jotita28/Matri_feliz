Rails.application.routes.draw do
  get 'todos/index'
  get 'todos/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :purveyors
  devise_for :users

  resources :services

  resources :todos
  
get 'users/home' 

root 'users#home'
end
