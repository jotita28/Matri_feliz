Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :purveyors
  devise_for :users

  resources :services, except: :index

  resources :todos do 
    resources :services, only: :index
  end
  
get 'users/home' 

root 'users#home'
end
