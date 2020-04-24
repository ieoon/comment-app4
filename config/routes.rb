Rails.application.routes.draw do
  devise_for :users
  root to: 'comments#index'
  resources :comments do
    resources :posts, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show 
  resources :likes, only: [:create, :destroy]
end