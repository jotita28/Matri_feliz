Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :purveyors
  devise_for :users

  resources :services, except: :index do 
    resources :favourites, only: [:create, :destroy]
  end

  resources :todos do 
    resources :services, only: :index
    post 'completed', to: 'todos#completed'
  end

  
  get 'users/home'
  root 'users#home'
end
