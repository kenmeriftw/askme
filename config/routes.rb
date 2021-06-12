Rails.application.routes.draw do
  root 'users#index'
  
  resource :session, only: %i[new create destroy]
  resources :tags, only: :show, param: :name
  resources :users
  resources :questions, except: %i[show new index ]

  # API V1 routes

  namespace :api do
    namespace :v1 do
      resources :user do
        resources :questions
      end
    end
  end
end
