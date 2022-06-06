Rails.application.routes.draw do
  devise_for :users

  resources :friends
  root 'home#index'
  get 'home/about'

  match "404", to: "errors#not_found", via: :all
  match "500", to: "errors#internal_server_error", via: :all
end
