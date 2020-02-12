Rails.application.routes.draw do

  devise_scope :user do
    authenticated :user do
      root to: 'posts#index', as: :authenticated_root
    end
  
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users
  resources :users, :only => [:show, :index]
  
  resources :posts, :only => [:create, :destroy, :index] do
    resources :likes, module: :posts
    resources :comments, :only => [:create, :destroy] do 
      resources :likes, module: :comments
    end
  end
end
