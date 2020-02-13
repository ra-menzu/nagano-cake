Rails.application.routes.draw do
  root "homes#top"
  get "home/about" => "homes#about"

  namespace :admin do
    resources :genres, only: [:index, :edit, :update, :create]
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
  	resources :orders,only:[:index,:show,:new,:create,]
    get :confirm
    get 'orders/complete' => 'orders#complete'
    resources :delivery_addresses,only:[:index,:create,:edit,:update,:destroy]
  	resources :order_histories
  	resources :cart_items
  end
   resources :guests,only:[:edit,:update,:show,:index,:destroy]
end