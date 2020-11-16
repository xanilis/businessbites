Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/update'
  get 'reviews/destroy'
  get 'favorites/index'
  get 'favorites/edit'
  get 'favorites/update'
  get 'favorites/destroy'
  get 'restaurants/index'
  get 'restaurants/show'
  devise_for :users 
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:edit, :update, :destroy]

  resources :users, only: [] do
    resources :favorites, only: [:edit, :update]
  end

  resources :favorites, only: :destroy
end
