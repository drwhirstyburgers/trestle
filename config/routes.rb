Rails.application.routes.draw do
  resources :checkpoint_contents
  resources :checkpoints
  resources :sections
  resources :courses
  devise_for :users
  post '/activate', to: 'courses#toggle_activate_course'

  resources :landing_pages

  resources :users

  get '/dash', to: 'dash#dash'

  root to: 'landing_pages#index'
end