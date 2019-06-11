Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      resources :pets
      get '/sample50pets', to: 'pets#sample_fifty'
      resources :users
      resources :matches
    end
  end
end
