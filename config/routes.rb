Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root 'static#home'
  get '/signin', to: 'session#new', as: 'signin'
  post '/signin', to: 'session#create'
  get '/session', to: 'session#destroy'
   
  get '/signup', to: 'users#new', as: 'new_user'
  get '/users', to:'users#index', as: 'users'
  post '/users', to:'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  
  resources :courses
  resources :reviews
  
  # get '/reviews/new', to: 'reviews#new', as: 'new_review'
  

end
