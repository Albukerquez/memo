Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  root to: 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
