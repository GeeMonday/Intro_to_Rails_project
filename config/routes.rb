Rails.application.routes.draw do
  get 'home/index'
  resources :users
  resources :pets
  resources :shelters
  resources :applications
  resources :favorites

  # Root path
  root "home#index"
end
