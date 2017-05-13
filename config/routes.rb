Rails.application.routes.draw do
  resources :posts
  root to: 'posts#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # as :user do
  #   # get 'login' => 'users/sessions#new', as: :new_user_session
  #   # post 'login' => 'users/sessions#create', as: :user_session
  #   delete 'logout' => 'users/sessions#destroy', as: :destroy_user_session
  #   get 'register' => 'users/registrations#new'
  # end
  # as user do
  #   # Registrations
  #   get   '/signup'   => 'users/registrations#new', as: :new_user_registration
  #   post  '/signup'   => 'users/registrations#create', as: :user_registration
  # end

  # devise_scope :user do
  #   get 'register', to: 'devise/registrations#new'
  #   get 'sign_in', to: 'devise/sessions#new'
  #   delete 'logout', to: 'devise/sessions#destroy'
  # end
end
