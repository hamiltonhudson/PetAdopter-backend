Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      resources :pets
      resources :users
      resources :matches
    end
  end
end
