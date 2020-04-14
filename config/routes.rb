  Rails.application.routes.draw do
    get 'home/index'
    #get 'destinations/:id/notes', to: 'destinations#notes'
    #get 'destinations/:id/notes/:note_id', to: 'destination#note'

    devise_for :users, controllers: { omniauth_callbacks: 'callbacks'}

    root to: "home#index"
    resources :trips
    resources :destinations
    resources :users
    resources :notes

    resources :trips do
      resources :destinations
    end
    
    resources :destinations do
      resources :notes 
    end
                            
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
