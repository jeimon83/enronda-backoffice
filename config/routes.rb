Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'static_pages#home'
  # get 'static_pages/about'
  # get 'static_pages/contact'
  # get 'static_pages/privacy_policy'
  # get 'static_pages/terms_of_service'

  get 'calendly/auth', to: 'calendly#auth'
  get 'calendly/callback', to: 'calendly#callback'
  post 'calendly/get_token', to: 'calendly#get_token'
  get 'calendly/events', to: 'calendly#events'

  resources :professionals do
    member do
      delete :destroy, as: :delete
    end
  end
  
  get '/calendly', to: 'calendly#index'
  get '/calendly/all', to: 'calendly#all'
end
