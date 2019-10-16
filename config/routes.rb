Rails.application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  Rails.application.routes.default_url_options[:host] = "localhost:8000"

  #  devise_for :admin, :controllers =>{
  #   :registrations => 'admin/registrations',
  #   :sessions => 'admin/sessions',
  #   :passwords => 'admin/passwords',
  #   :confirmations => 'admin/confirmations',
  #   :unlocks => 'admin/unlocks',
  # }

  namespace :admin do
    resources :user_requirements
    
  end
  
  resources :admin
    root "users#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      delete '/room_images/:id' => "room_images#destroy" 
      get '/room_images/:id' => "room_images#show"
      get '/room_images/:id/edit' => "room_images#edit"
      put '/room_images/:id' => "room_images#update"
      post '/room_images/new' => "room_images#new"
      post '/room_images/create' => "room_images#create"
      post '/room_images' => "room_images#create"

      get '/room_images' => "room_images#index"
      get '/room_types' => "room_types#index"
      get '/user_types' => "user_types#index"
      

     
      get '/user_room_types' => "user_room_types#index"

      resources :users

      get '/user_room_images' => "user_room_images#index"
      post '/user_room_images/new' => "user_room_images#new"
      post '/user_room_images/create' => "user_room_images#create"
      post '/user_room_images' => "user_room_images#create"


      get '/user_requirements' => "user_requirements#index"
      post '/user_requirements/new' => "user_requirements#new"
      post '/user_requirements/create' => "user_requirements#create"
      post '/user_requirements' => "user_requirements#create"


      post 'user_token' => 'user_token#create'
      post 'find_user' => 'users#find'
      
      post 'auth/login' => 'authentication#login'

      post 'passwords/forgot', to: 'passwords#forgot'
      get 'passwords/reset', to: 'passwords#reset'
      put 'passwords/update', to: 'passwords#update'

    end
  end
  
  post 'authenticate', to: 'authentication#authenticate'
  get 'find_user', to: 'authentication#find_user'
end
