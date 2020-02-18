Rails.application.routes.draw do

  devise_scope :user do
    authenticated :user do
      root to: 'posts#index', as: :authenticated_root
    end
  
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  post '/friendship/create/:id', to: 'friendships#create'

  resources :users, :only => [:show, :index]
  resources :friendships
  
  resources :posts, :only => [:create, :destroy, :index] do
    resources :likes, module: :posts
    resources :comments, :only => [:create, :destroy] do 
      resources :likes, module: :comments
    end
  end


end
