Rails.application.routes.draw do

  resources :stations, only: [:index, :show]
  resources :conditions, only: [:index, :show]
  resources :trips, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
