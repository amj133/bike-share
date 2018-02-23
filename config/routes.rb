Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "welcome#index"

  resources :trips, only: [:index, :show]
  get "/trips-dashboard", to: "trips#dashboard"

  resources :conditions, only: [:index, :show]

  resources :stations, only: [:index, :show], param: :slug
  get "/stations-dashboard", to: "stations#dashboard"

  resources :users, only: [:show, :new, :create]
  get "/dashboard", to: "users#show"

  resources :carts, only: [:create]

  get "/bike-shop", to: "accessories#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :conditions, only: [:index, :show, :destroy, :edit, :update, :new, :create]
    resources :stations, only: [:index ,:show, :destroy, :edit, :update], param: :slug
    resources :trips, only: [:index ,:show, :destroy, :edit, :update, :new, :create]
  end
end
