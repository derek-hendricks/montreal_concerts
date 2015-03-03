Rails.application.routes.draw do
  root to: 'concerts#index'
  get '/concerts/authorize', to: 'concerts#connect'
  get '/concerts/:id/like/:track_id', to: 'concerts#show'
  get '/concerts/:id/comments/:comment', to: 'concerts#show'
  resources :concerts
end
