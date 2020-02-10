Rails.application.routes.draw do
  root "homes#top"
  get "home/about" => "homes#about"

  namespace :admin do
    get 'genres/new'
    post 'genres/new' => "genres#create"
    get 'genres/edit'
    get 'orders/new'
    get 'guests/new'

    resources :guests,only:[:index,:show,:edit,:update]

    resources :products
    devise_for :guests
  end

  devise_for :guests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :guest do
  	resources :products
  	resources :orders
    resources :delivery_addresses,only:[:index,:create,:edit,:update,:destroy]
  	resources :order_histories
  	resources :cart_item
    
  end
   resources :guests
end