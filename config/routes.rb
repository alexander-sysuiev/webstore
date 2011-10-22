Webstore::Application.routes.draw do |map|
  map.root :controller => :boilers, :action => :index
  devise_for :admins
  map.resources :boilers, :only => [:index]
  map.resources :services, :only => [:index]
  map.resources :categories, :only => [] do |categories|
  	categories.resources :boilers, :only => [:index, :show]
  	categories.resources :services, :only => [:index, :show]
  end
  map.resource :about, :only => [:show]
  map.namespace :admin do |admin|
    admin.root :controller => :base, :action => :show
    admin.resource :base, :only => [:update]
    admin.resources :boilers, :only => [:new, :create]
    admin.resources :services, :only => [:new, :create]
    admin.resources :categories, :only => [:new, :create]
    admin.resources :settings, :only => [:new, :create, :index]
  end
end
