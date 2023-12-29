Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'staticpages#top'
  get 'login' => 'user_sessions#new'
  post 'login' => 'user_sessions#create'
end
