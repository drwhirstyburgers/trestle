Rails.application.routes.draw do
  devise_for :users
  resources :landing_pages
  root to: 'landing_pages#index'
end