Rails.application.routes.draw do
  root to: 'concert#index'
  resources :concert
end
