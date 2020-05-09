Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show] do
    resources :courses, only: [:create]
  end
  post '/courses/:id/update_time', to: 'courses#update_time'
  post '/slots/:id/update_time', to: 'slots#update_time'

  get '/api/v1/users/:id/courses', to: 'courses#create_api'
  get '/api/v1/users/:id/slots', to: 'slots#create_api'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
