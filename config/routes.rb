Rails.application.routes.draw do
  root "tops#index"
  resources :users, only: [:new, :create]
  resources :user_sessions, only: [:new, :create, :destroy]
  delete 'logout', to: 'user_sessions#destroy', as: :logout
  get "up" => "rails/health#show", as: :rails_health_check
end
