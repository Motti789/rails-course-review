Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root 'static#home'

  get '/signin', to: 'session#new', as: 'signin'
  get '/auth/github/callback' => 'session#omniauth'
  post '/signin', to: 'session#create'
  get '/session', to: 'session#destroy'
  

  get '/signup', to: 'users#new', as: 'new_user'
  post '/users', to:'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  
  
  
  resources :users, only: [:new, :create, :show] do
    # nested resource for reviews
    resources :reviews
  end

  resources :reviews

   
  
  
  

end
