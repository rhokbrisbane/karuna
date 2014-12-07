Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :groups,  only: [:index, :show] do
    resources :articles ,  only: [:index, :show]
  end

  get ':id', to: 'groups#show', as: 'short_group'

  root to: 'home#index'
end
