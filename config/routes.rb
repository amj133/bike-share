Rails.application.routes.draw do

  resources :trips, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :stations, only: [:index]
end
