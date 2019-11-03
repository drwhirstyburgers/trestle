Rails.application.routes.draw do
  resources :checkpoints
  get '/get_checkpoints', to: 'checkpoints#get_section_checkpoints'

  resources :section

  resources :courses
  post '/activate', to: 'courses#toggle_activate_course'

  devise_for :users

  resources :landing_pages

  resources :users

  get '/dash', to: 'dash#dash'

  root to: 'landing_pages#index'
end