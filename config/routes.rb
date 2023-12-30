Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'static_pages#top'
  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
  get 'logout' => 'user_sessions#destroy'
  get 'about' => 'static_pages#about'
  get 'test' => 'users#test', defaults: { format: :json }
  resources :users
  resources :posts
end
