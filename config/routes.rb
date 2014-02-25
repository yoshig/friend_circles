Social::Application.routes.draw do
  root to: "users#index"

  resources :users, except: [:destroy] do
    get 'feed'
    resource :reset_password, only: [:edit]
    resources :friend_circles, except: [:show]
    resources :posts, except: [:show]
  end
  resource :session, only: [:new, :create, :destroy]
  resource :reset_password, only: [:new, :create, :edit]
  resources :friend_circles, only: [:show]
  resources :posts, only: [:show] do
    get 'upvote'
  end
end
