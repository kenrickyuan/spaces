Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update] do
    resources :booking, only: [:index]
    resources :spaces, except: [:show] do
      resources :bookings, except: [:index]
    end
  end
  resources :spaces, only: [:index, :show] do
    resources :bookings, only: [:create]
  end
end
