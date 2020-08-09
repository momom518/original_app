Rails.application.routes.draw do
  devise_for :users
  root to: 'sales#index'
  
  resources :sales, only: [:index, :destroy, :show]

  resources :shops do
    resources :sales, only: [:new, :create]
    resource :bookmarks, only: [:create, :destroy]
  end
end
