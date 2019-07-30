Rails.application.routes.draw do
  root 'vehicles#index'
  resources :vehicles do
  	resources :locations
  end
end
