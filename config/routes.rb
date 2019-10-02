Rails.application.routes.draw do
  devise_for :users

  resources :landing_pages

  get '/dash', to: 'dash#dash'

  root to: 'landing_pages#index'
end