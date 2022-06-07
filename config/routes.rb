Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :friends
  root 'home#index'
  get 'home/about'

  namespace 'api' do
    namespace 'v1' do
      resources :friends
    end
  end

  match "404", to: "errors#not_found", via: :all
  match "500", to: "errors#internal_server_error", via: :all
end
