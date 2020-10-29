Rails.application.routes.draw do
  
  root :to => 'auth_controller#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do 
      namespace :v1 do 
        resources :owners
        resources :foodtrucks
        resources :schedules
        resources :menus
        resources :items
        resources :ratings
        resources :notes 
        post '/login', to: 'auth#create'
        get '/profile', to: 'foodtrucks#profile'
        post '/search', to: 'foodtrucks#search'
      end
    end
  
    





end
