Webstore::Application.routes.draw do |map|
  map.root :controller => :categories, :action => :index
  map.resources :boilers, :only => [:index]
  map.resources :services, :only => [:index]
  map.resources :categories, :only => [] do |categories|
  	categories.resources :boilers, :only => [:index, :show]
  	categories.resources :services, :only => [:index, :show]
  end
  map.resource :about, :only => [:show]
end
