Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show] do
    resources :spaces do
      resources :bookings
    end
  end
  resources :spaces, only: [:index, :show]
end
