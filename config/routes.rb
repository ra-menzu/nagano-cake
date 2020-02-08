Rails.application.routes.draw do
  namespace :admin do
    get 'genres/new'
    get 'orders/new'
    get 'guests/new'
    get 'products/new'
    devise_for :guests
  end

  devise_for :guests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :guest do
  	resources :products
  	resources :orders
  	resources :order_histories
  	resources :delivary_adresses
  	resources :cart_item
  end
end
