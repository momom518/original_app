Rails.application.routes.draw do
  devise_for :users
  root to: 'sales#index'

  # resources :bookmark, only: [:index]
  resources :shops do
    resources :sales, only: %i[index new create edit update destroy]
    # resources :bookmark, only: [:create, :destroy]
  end
end
