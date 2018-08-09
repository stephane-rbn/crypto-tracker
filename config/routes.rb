Rails.application.routes.draw do
  root 'home#index'

  get '/index', to: 'home#index'
end
