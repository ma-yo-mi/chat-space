Rails.application.routes.draw do

  devise_for :users
  root  'groups#index'
  resources :groups, only: [:edit, :new, :create, :update] do
    resources :messages, only: [:index, :new, :create]
  end
end
