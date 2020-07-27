Rails.application.routes.draw do
  devise_for :users
  root to: 'sales#index'
  resources :sales, only: [:index]
end
