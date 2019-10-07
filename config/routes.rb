Rails.application.routes.draw do
  resources :courses
  devise_for :users

  resources :landing_pages

  resources :users

  get '/dash', to: 'dash#dash'

  root to: 'landing_pages#index'
end