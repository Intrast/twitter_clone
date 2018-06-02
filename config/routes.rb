Rails.application.routes.draw do
  get 'log_in' => 'sessions#new'
  delete 'log_out' => 'sessions#destroy'
  get 'sing_up' => 'users#new'
  delete 'delete' => 'tweets#destroy'
  

  resources :users do
    member do
      get :followers, :followed
    end
  end
  resources :tweets
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]

  root 'home#index'
end
