Rails.application.routes.draw do
  root :to => "events#index"
  resources :comments
  resources :goings
  resources :events
  devise_for :profiles
  resources :profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
