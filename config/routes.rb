Rails.application.routes.draw do
  # Static pages
  get 'about', to: 'pages#about'
  
  # Devise routes for user authentication and registration
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # User profile and related routes
  resources :users, only: [:index, :show] do
    collection do
      get 'profile', to: 'users#profile', as: 'profile'
    end
  end

  # Resources for dogs, shelters, applications, and favorites
  resources :dogs, only: [:index, :show] do
    resource :favorite, only: [:create, :destroy]
  end

  resources :shelters, only: [:index, :show]
  resources :applications, only: [:index, :show]

  # Root path
  root "home#index"
end




