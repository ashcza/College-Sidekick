Rails.application.routes.draw do
  resources :sidekicks
  resources :requests, only: [:create]
  root "sidekicks#index"

end
