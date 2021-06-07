Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resource :session, only: %i[new create destroy]
  resources :questions, except: %i[show new index ]

  get 'tags' => 'search#index'

  # API V1 routes

  namespace :api do
    namespace :v1 do
      resources :user do
        resources :questions
      end
    end
  end
end
