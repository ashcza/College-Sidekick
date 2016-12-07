Rails.application.routes.draw do
  resources :sidekicks
  root "sidekicks#index"

end
