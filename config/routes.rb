Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}

  resources :users, only: [:index, :show]
  resources :dogs, only: [:index, :show]
  resources :shelters, only: [:index, :show]
  resources :applications, only: [:index, :show]
  resources :favorites, only: [:index, :show]

  # Root path
  root "home#index"
end
