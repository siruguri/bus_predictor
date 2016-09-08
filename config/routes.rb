Rails.application.routes.draw do
  resources :registrations, only: [:index]
  resources :observations, only: [:index]

  post '/ajax_api' => 'ajax#multiplex'

  scope :score_arrivals, controller: 'score_arrivals' do
    get :generate
    get :show
  end
end
