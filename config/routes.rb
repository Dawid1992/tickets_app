Rails.application.routes.draw do
  resources :fanalert
  resources :tickets
  resources :events
  get 'home/index'
  root 'events#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
