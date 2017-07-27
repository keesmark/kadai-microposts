Rails.application.routes.draw do
  devise_for :users
  root to: 'toppages#index'
  
  get 'home/index'
  root to: 'home#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only:[:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :favarites
    end
  end
  
  resources :microposts, only: [:create, :destroy] do
    resource :favarites, only: [:create, :destroy]
  end
  
  resources :relationships, only: [:create, :destroy]
  
end
