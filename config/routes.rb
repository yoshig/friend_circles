Social::Application.routes.draw do
  resources :users, only: [:create, :new, :edit, :update, :show] do
    resource :reset_password, only: [:edit]
  end
  resource :session, only: [:new, :create, :destroy]
  resource :reset_password, only: [:new, :create, :edit]
end
