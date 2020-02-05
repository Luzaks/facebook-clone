Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user do
      root to: 'users#show', as: :authenticated_root
    end
  
    unauthenticated :user do
      root to: 'static_pages#home', as: :unauthenticated_root
    end
  end
  devise_for :users
  resources :users, :only => [:show, :index]
  resources :posts, :only => [:create]

end
