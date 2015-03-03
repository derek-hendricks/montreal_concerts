Rails.application.routes.draw do
  root to: 'concerts#index'
  get '/concerts/authorize', to: 'concerts#connect'
  resources :concerts
end
