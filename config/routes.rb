Rails.application.routes.draw do  
  resources :resources, only: [:index, :create] do
    get :search, on: :collection
    resources :cities, only: [:index, :create] do
      get :search, on: :collection
    end
  end

  resource :vaccines do
    get :state, on: :collection
    get :district, on: :collection
    get :find_by_district, on: :collection
  end
  
  root  'resources#index'
end
