Rails.application.routes.draw do
  resources :cities, only: [:index, :create] do
    get :search, on: :collection
  end
  resources :resources, only: [:index, :create]
  resources :tweets, only: [:create] do
    get :search, on: :collection
  end
  
  root  'tweets#dashboard'
end
