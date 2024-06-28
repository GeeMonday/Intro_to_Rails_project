Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :pets, only: [:index, :show]
  resources :shelters, only: [:index, :show]
  resources :applications, only: [:index, :show]
  resources :favorites, only: [:index, :show]

  # Root path
  root "home#index"
end
