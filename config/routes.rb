Rails.application.routes.draw do
  get 'about', to: 'pages#about'
  get 'pages/about'
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/update'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:index, :show]
  get 'profile', to: 'users#profile', as: 'profile'
  resources :dogs, only: [:index, :show]
  resources :shelters, only: [:index, :show]
  resources :applications, only: [:index, :show]
  resources :favorites, only: [:create, :destroy]

  # Root path
  root "home#index"
end

