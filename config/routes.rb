Rails.application.routes.draw do
  root "homes#top"
  get "home/about" => "homes#about"
  get'admin/top' => 'admin#index'
  get'admin/index'=> 'admin#index'
  get'admin/show' => 'admin#show'

  namespace :admin do
    resources :genres, only: [:index, :edit, :update, :create]
    resources :orders, only: [:index, :show, :update]
    resources :guests, only: [:index,:show,:edit,:update]
    resources :products
    devise_scope :admin do
      get 'guests/sign_in' => 'devise/sessions#new'
      post 'guests/sign_in' => 'devise/sessions#cteate'
      delete 'guests/sign_out' => 'devise/sessions#destroy'
      get 'guests/sign_up' => 'devise/registrations#new'
      delete 'guests' => 'devise/registrations#destroy'
      post 'guests' => 'devise/registrations#create'
    end
  end
  devise_for :guests

  resources :guests,only:[:edit,:update,:show,:index,:destroy]

  namespace :guest do
  	resources :products
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders,only:[:index,:show,:new,:create,]
    resources :delivery_addresses,only:[:index,:create,:edit,:update,:destroy]
  	resources :order_histories
  	resources :cart_items
    delete 'cart_item' => 'cart_items#destroy_all'
  end
end