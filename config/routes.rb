Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'albums#index'
  resources :albums do
    resources :songs
  end
end
