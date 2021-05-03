Rails.application.routes.draw do
  root 'users#index'

  resources :users, except: :destroy
  resource :session, only: %i[new create destroy]
  resources :questions, except: %i[show new index ]

  get 'search' => 'search#index'
  get 'hashtag/destroy'
end
