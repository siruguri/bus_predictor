Rails.application.routes.draw do
  resources :registrations, only: [:index]
  resources :observations, only: [:index]

  post '/ajax_api' => 'ajax#multiplex'  
end
