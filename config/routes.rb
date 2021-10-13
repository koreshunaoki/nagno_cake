Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    resources :customers
  end
  namespace :admin do
    resources :genres
  end
  namespace :admin do
    resources :items
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    resources :addresses
  end
  namespace :public do
    get 'orders/thanks'
    post "orders/confirm"
    resources :orders
  end
  namespace :public do
    delete 'cart_items/destroy_all'
    resources :cart_items, only: [:index, :destroy, :create, :update]
  end
  namespace :public do
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
    resources :customers, only: [:edit, :update]
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :customers
  devise_for :admins
  get "/homes/about" => "public/homes#about"
  root to: 'public/homes#top'
  get "/customers/my_page" => "public/customers#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
