Rails.application.routes.draw do
  resources :bug_reports

  resources :previews
  get '/preview_info', to: 'previews#course_preview'
  post '/charge_course', to: 'previews#create_charge'

  resources :choices
  post '/submit_choices', to: 'choices#submit_choices'
  post '/update_choice', to: 'choices#change_choice'

  resources :questions
  
  resources :quizzes
  post '/quiz_submission', to: 'quizzes#submit_quiz'
  get '/check_user_quiz', to: 'quizzes#check_quiz'

  resources :checkpoints
  get '/get_checkpoints', to: 'checkpoints#get_section_checkpoints'
  post '/mark_checkpoint_complete', to: 'checkpoints#mark_checkpoint_complete'
  get '/check_if_complete', to: 'checkpoints#check_if_complete'
  get '/next_checkpoint', to: 'checkpoints#next_checkpoint'
  post '/sort_checkpoints', to: 'checkpoints#sort'

  resources :sections
  get '/get_section_progress', to: 'sections#get_section_progress'

  resources :courses
  post '/activate', to: 'courses#toggle_activate_course'
  post '/add_course', to: 'courses#create_user_course'
  post '/uc_active', to: 'courses#activate_user_course'
  post '/admin_add_course', to: 'courses#admin_add_course'
  get '/get_courses', to: 'courses#get_courses'
  get '/get_course_progress', to: 'courses#get_course_progress'
  get '/get_course_progress_users', to: 'courses#users_show_course_progress'
  
  devise_for :users
  resources :users do
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
  end
  delete '/sign_out_user', to: 'dash#sign_out'
  post '/make_admin', to: 'users#make_admin'
  get '/get_user_show_data', to: 'users#get_course_data'

  resources :landing_pages

  get '/dash', to: 'dash#dash'
  get '/where_you_are', to: 'dash#where_you_are'
  get '/sections_and_checkpoints', to: 'dash#get_s_and_c'
  get '/new_students', to: 'dash#get_new_students'
  get '/get_new_guests', to: 'dash#get_new_guests'
  get '/get_monthly_revenue', to: 'dash#monthly_revenue'
  get '/get_admin_dash_graph_data', to: 'dash#get_graph_data'

  root to: 'landing_pages#index'
end