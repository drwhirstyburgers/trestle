Rails.application.routes.draw do
  resources :sections

  resources :courses
  post '/activate', to: 'courses#toggle_activate_course'
  
  devise_for :users

  resources :landing_pages

  resources :users

  get '/dash', to: 'dash#dash'

  root to: 'landing_pages#index'
end