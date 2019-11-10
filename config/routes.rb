Rails.application.routes.draw do
  resources :checkpoints
  resources :sections
  get '/get_checkpoints', to: 'checkpoints#get_section_checkpoints'

  resources :courses
  post '/activate', to: 'courses#toggle_activate_course'
  
  devise_for :users

  resources :landing_pages

  resources :users

  get '/dash', to: 'dash#dash'

  root to: 'landing_pages#index'
end