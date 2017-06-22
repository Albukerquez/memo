Rails.application.routes.draw do
  root to: 'posts#index'
  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile

  resources :posts do
    resources :comments
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
