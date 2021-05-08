Rails.application.routes.draw do
  resources :cities, only: [:index, :create] do
    get :search, on: :collection
    resources :resources, only: [:index, :create] do
      get :search, on: :collection
    end
  end
  
  root  'cities#index'
end
