Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do 
      namespace :v1 do 
        resources :owners
        resources :food_trucks
        post '/login', to: 'auth#create'
      end
    end
  
    





end
