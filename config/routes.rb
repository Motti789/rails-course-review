Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root 'static#home'
  get '/signin', to: 'session#new', as: 'signin'
  post '/signin', to: 'session#create'
  delete '/session/', to: 'session#destroy'
   
  get '/signup', to: 'users#new', as: 'new_user'
  get '/users', to:'usersts#index', as: 'users'
  post '/users', to:'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  
  resources :courses
  resources :reviews
  

end
