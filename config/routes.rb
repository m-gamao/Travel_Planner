Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks'}

  root to: "home#index"
  resources :trips
  resources :destinations
  resources :users
  resources :locations

                          
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
