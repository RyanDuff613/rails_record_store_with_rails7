Rails.application.routes.draw do
  root to: 'albums#index'
  resources :albums do
    resources :songs
  end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
