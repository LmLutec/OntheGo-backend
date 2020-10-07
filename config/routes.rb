Rails.application.routes.draw do
  resources :ratings
  resources :notes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do 
      namespace :v1 do 
        resources :owners
        resources :foodtrucks
        resources :schedules
        resources :menus
        resources :items
        resources :locations
        post '/login', to: 'auth#create'
        get '/profile', to: 'foodtrucks#profile'
        post '/search', to: 'foodtrucks#search'
      end
    end
  
    





end
