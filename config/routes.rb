Rails.application.routes.draw do
  get 'info_weddings/index'
  get 'purveyors/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :purveyors
  devise_for :users

  resources :services, except: :index do 
    delete 'remove', to: 'favourites#remove', on: :member
    collection do
    get 'myservices', to: 'services#my_services'
    get 'mysales', to: 'services#my_sales'
    end
    resources :favourites, only: :create
    resources :bookings, only: :create
    resources :purveyors, only: :show
  end

  resources :bookings, except: :create do 
    get 'cart', to: 'bookings#cart', on: :collection
  end

  resources :todos do
    resources :services, only: :index
    post 'completed', to: 'todos#completed'
  end

  resources :billings, only: [] do
    collection do
      get 'mis_compras'
      get 'pre_pay'
      get 'execute'
      get 'detail'
    end
  end
  
  resources :info_weddings
  post 'services/search', to: 'services#search'
  get 'users/home'
  root 'users#home'
end
