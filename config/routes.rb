Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'reports/index'
      post 'reports/create'
      delete 'reports/:id', to: 'reports#destroy'
    end
  end
  
  resources :elements
  resources :reports

  resources :reports do
  resources :elements
  end

  root 'reports#index'
  
end
