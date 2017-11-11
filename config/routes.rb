Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#github'
  resources :addresses, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :reservations, only: [:index, :edit, :update, :destroy]
  resources :rooms, only: :show do
    resources :room_types, only: :show
    resources :reservations, only: :create
  end
  root 'hotels#index'
end
