Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pets
      resources :users
      resources :matches
    end
  end
end
