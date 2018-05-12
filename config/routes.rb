Rails.application.routes.draw do

 resources :users
 resources :exercises
 resources :workouts 

 get '/login', to: 'sessions#new'

 post '/sessions', to: 'sessions#create'

 get '/logout', to: 'sessions#destroy'

 root 'application#welcome'

end
