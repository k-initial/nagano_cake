Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
  sessions: "admin/sessions"
}
  
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    resources :shopping_addresses, only: [:index,:edit,:create,:update,:destroy]
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    resources :customers, only: [:show,:edit,:update]
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    post 'orders/confirmation' => 'orders#confirmation', as: 'confirmation'
    get 'orders/complete' => 'orders#complete', as: 'complete'
    resources :orders, only: [:new,:create,:index,:show]
    delete 'cart_items/all_destroy' => 'cart_items#all_destroy', as: 'all_destroy'
    resources :cart_items, only: [:index,:update,:destroy,:create]
    resources :items, only: [:index,:show]
  end
  
  
  namespace :admin do
    resources :order_details, only: [:update]
    resources :orders, only: [:index,:show,:update]
    resources :items, only: [:show,:index,:new,:create,:edit,:update]
    resources :genres, only: [:index,:create,:edit,:update]
    resources :customers, only: [:index,:edit,:update,:show]
    get '' => 'homes#top', as: 'admin'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
