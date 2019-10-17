Rails.application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  Rails.application.routes.default_url_options[:host] = "localhost:8000"
  
  resources :admin
  root "users#index"
  
  namespace :api do
    namespace :v1 do
      get '/room_images' => "room_images#index"
      get '/room_types' => "room_types#index"
      get '/user_types' => "user_types#index"
      get '/user_room_types' => "user_room_types#index"
      get '/user_room_images' => "user_room_images#index"

      get '/user_requirements' => "user_requirements#index"
      post '/user_requirements/new' => "user_requirements#new"
      post '/user_requirements/create' => "user_requirements#create"
      post '/user_requirements' => "user_requirements#create"

      resources :users

      post 'user_token' => 'user_token#create'
      post 'find_user' => 'users#find'
      
      post 'auth/login' => 'authentication#login'

      post 'passwords/forgot', to: 'passwords#forgot'
      get 'passwords/reset', to: 'passwords#reset'
      put 'passwords/update', to: 'passwords#update'

    end
  end
end
