Rails.application.routes.draw do
  resources :organizations
  resources :nodes

  devise_for :users

  mount ActionCable.server => '/cable'
end
