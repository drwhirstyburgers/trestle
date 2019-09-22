Rails.application.routes.draw do
  resources :landing_pages
  root to: 'landing_pages#index'
end
