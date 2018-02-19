Rails.application.routes.draw do

  root to: "welcome#index"

  resources :trips, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :stations, only: [:index, :show]

  resources :users, only: [:show, :new, :create]
  get "/dashboard", to: "users#show"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
