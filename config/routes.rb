Rails.application.routes.draw do
  namespace :admin do
    get 'genres/new'
    get 'orders/new'
    get 'guests/new'
    get 'products' => 'products#index'
    get 'products/new' => 'products#new'
    post 'products/new' => 'products#create'
    get 'products/:id/edit' => 'products#edit'
    get 'products/:id' => 'products#show'
    patch 'products/id' => 'products#update'
    post 'products/id' => 'products#update'
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
