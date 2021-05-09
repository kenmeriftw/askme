Rails.application.routes.draw do
  root 'users#index'

  resources :users, except: :destroy
  resource :session, only: %i[new create destroy]
  resources :questions, except: %i[show new index ]

  get 'search' => 'search#index'
  get 'hashtag/destroy'

  # API V1 routes

  namespace :api do
    namespace :v1 do
      resources :user do
        resources :questions
      end
    end
  end
end
