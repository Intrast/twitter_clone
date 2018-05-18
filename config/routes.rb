Rails.application.routes.draw do
  get 'log_in' => 'sessions#new'
  delete 'log_out' => 'sessions#destroy'
  get 'sing_up' => 'users#new'
  delete 'delete' => 'tweets#destroy'

  resources :users, only: [:new, :create, :edit, :update]
  resources :tweets
  resources :sessions, only: [:new, :create, :destroy]
  root 'home#index'
end
