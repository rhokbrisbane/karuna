Rails.application.routes.draw do
  resources :groups

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :articles,   only: [:index, :show]
  resources :groups,     only: [:index, :show]

  root to: 'home#index'
end
