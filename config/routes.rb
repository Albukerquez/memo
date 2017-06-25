Rails.application.routes.draw do
  match 'like', to: 'likes#like', via: :post
  match 'unlike', to: 'likes#unlike', via: :delete

  devise_scope :user do
    get '/register', to: 'devise/registrations#new', as: 'new_user_registration' # custom path to sign_up/registration
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root to: 'posts#index'
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile
  # get '/new', to: 'posts#new', as: :new_post
  resources :posts do
    resources :comments
  end
end
