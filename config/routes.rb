Rails.application.routes.draw do
  root 'home#index'

  get '/display', to: 'home#display'
  get '/save', to: 'home#save'
end
