Rails.application.routes.draw do
  devise_for :customers, :controllers => { registrations: 'registrations' }
  get 'home/index'
  get 'products/index'
  get 'devise/user_session'
  get 'devise/destroy_user_session'

  resources :products
  resources :devise
  # resources :charges
  resources :orders

  resources :images, only: [:index, :new, :create, :destroy]

  root 'home#index'
end
