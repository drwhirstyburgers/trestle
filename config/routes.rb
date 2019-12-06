Rails.application.routes.draw do
  resources :choices
  post '/submit_choices', to: 'choices#submit_choices'
  resources :questions
  resources :quizzes
  resources :checkpoints
  resources :sections
  get '/get_checkpoints', to: 'checkpoints#get_section_checkpoints'

  resources :courses
  post '/activate', to: 'courses#toggle_activate_course'
  post '/add_course', to: 'courses#create_user_course'
  
  devise_for :users
  delete '/sign_out_user', to: 'dash#sign_out'

  resources :landing_pages

  resources :users

  get '/dash', to: 'dash#dash'

  root to: 'landing_pages#index'
end