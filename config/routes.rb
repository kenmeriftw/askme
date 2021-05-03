Rails.application.routes.draw do
  get 'hashtag/destroy'
  root 'users#index'

  resources :users
  resource :session, only: %i[new create destroy]
  resources :questions, except: %i[show new index ]

  get 'search' => 'search#index'
end
