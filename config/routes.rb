Rails.application.routes.draw do
  devise_for :guests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :guest do
  	resources :products
  	resources :orders
  	resources :order_histories
  	resources :guests
  	resources :delivary_adresses
  	resources :cart_item
  end
end
