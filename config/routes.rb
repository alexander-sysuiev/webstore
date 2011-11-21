Webstore::Application.routes.draw do
  root :controller => :boilers, :action => :index
  devise_for :admins
  resources :boilers, :only => [:index]
  resources :services, :only => [:index]
  resources :categories, :only => [] do
  	resources :boilers, :only => [:index, :show]
  	resources :services, :only => [:index, :show]
  end
  resources :orders, :only => [:new, :create]
  resource :about, :only => [:show]
  resource :cart, :only => [:create] do
    member do
      post :decrease
      post :clear
    end
  end
  namespace :admin do
    root :controller => :base, :action => :show
    resources :orders, :only => [:index, :show, :update]
    resources :base, :controller => :base, :only => [:update]
    resources :boilers, :only => [:new, :create, :edit, :update]
    resources :services, :only => [:new, :create, :edit, :update]
    resources :categories, :only => [:new, :create]
    resources :settings, :only => [:new, :create, :index]
  end
end
