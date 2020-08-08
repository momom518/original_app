Rails.application.routes.draw do
  devise_for :users
  root to: 'sales#index'

  # resources :bookmark, only: [:index]
  resources :sales, only: [:index,:destroy]
  resources :shops do
    resources :sales, only: [:new, :create]
    # resources :bookmark, only: [:create, :destroy]
  end
end
