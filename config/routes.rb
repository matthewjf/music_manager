Rails.application.routes.draw do
  root 'bands#index'

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  post 'login' => 'sessions#create'

  resources :users do
    member do
      get :admin
      get :deadmin
    end
  end

  resources :bands do
    resources :albums, only: :new
  end

  resources :albums, except: [:new, :index] do
    resources :tracks, only: :new
  end

  resources :tracks, except: [:index, :new] do
    resources :notes, only: [ :destroy, :new, :create ]
  end
end
