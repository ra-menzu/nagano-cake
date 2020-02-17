Rails.application.routes.draw do
  devise_for :admins, controllers: {
      sessions: 'admin/sessions'
    }
  root "homes#top"
  get "home/about" => "homes#about"
  get'admin/top' => 'admin#top'

  namespace :admin do
    resources :genres, only: [:index, :edit, :update, :create]
    resources :orders, only: [:index, :show, :update]
    resources :products
    resources :guests
  end
  devise_for :guests

  resources :guests,only:[:edit,:update,:show,:index,:destroy]
  resources :ordered_items

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