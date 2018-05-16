Rails.application.routes.draw do
  get 'tweets/new'

  get 'tweets/create'

  get 'tweets/destroy'

  get 'log_in' => 'sessions#new'
  delete 'log_out' => 'sessions#destroy'
  get 'sing_up' => 'users#new'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root 'home#index'
end
