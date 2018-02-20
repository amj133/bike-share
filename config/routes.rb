Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "welcome#index"

  resources :trips, only: [:index, :show]

  resources :conditions, only: [:index, :show]

  resources :stations, only: [:index, :show]
  get "/stations-dashboard", to: "stations#dashboard"

  resources :users, only: [:show, :new, :create]
  get "/dashboard", to: "users#show"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :conditions, only: [:index, :show, :destroy]
     resources :stations, only: [:index ,:show, :destroy]
      resources :trips, only: [:index ,:show, :destroy, :edit, :update]
  end
end
