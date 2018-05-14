Rails.application.routes.draw do

 resources :users do 
 	resources :workouts 
 end 
 resources :exercises
 

 get '/login', to: 'sessions#new'

 post '/sessions', to: 'sessions#create'

 get '/logout', to: 'sessions#destroy'

 root 'application#welcome'

end
