Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "welcome#index"

  resources :trips, only: [:index, :show]
  get "/trips-dashboard", to: "trips_dashboard#index"

  resources :conditions, only: [:index, :show]
  get "/weather-dashboard", to: "conditions#dashboard"

  resources :stations, only: [:index, :show], param: :slug
  get "/stations-dashboard", to: "stations#dashboard"

  resources :users, only: [:show, :new, :create, :edit, :update]
  get "/dashboard", to: "users#show"

  resources :carts, only: [:create]
  get "/cart", to: "carts#show"
  patch "/increase-quantity", to: "carts#increase"
  patch "/decrease-quantity", to: "carts#decrease"
  patch "/remove-accessory", to: "carts#remove"

  resources :accessories, only: [:show, :create]
  get "/bike-shop", to: "accessories#index"
  get "/bike-shop/new", to: "accessories#new"

  resources :orders, only: [:create, :show]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :conditions, only: [:index, :show, :destroy, :edit, :update, :new, :create]
    resources :stations, only: [:index ,:show, :destroy, :edit, :update, :new, :create], param: :slug
    resources :trips, only: [:index ,:show, :destroy, :edit, :update, :new, :create]
    resources :orders, only: [:update]
    get "/dashboard", to: "orders#index"
    resources :accessories, only: [:edit, :update]
    get "/bike-shop", to: "accessories#index"
    patch "retire", to: "accessories#retire"
    patch "activate", to: "accessories#activate"
  end
  resources :error, only: [:show]
  get '*path' => 'errors#show', via: [:get, :post]
end
