Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'static_pages#top'
  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  get 'logout' => 'user_sessions#destroy'
  get 'about' => 'static_pages#about'
  resources :users, only: %i[new create]
  resources :posts
end