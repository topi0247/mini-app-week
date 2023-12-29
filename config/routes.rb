Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'static_pages#top'
  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  resources :users, only: %i[new create]
end
