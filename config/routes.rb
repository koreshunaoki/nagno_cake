Rails.application.routes.draw do

  devise_scope :customer do
    get 'customers/sign_in', to: 'public/sessions#new'
    post 'customers/sign_in', to: 'public/sessions#create'
    delete 'customers/sign_out', to: 'public/sessions#destroy'
    post 'customers', to: 'public/registrations#create'
    get 'customers/sign_up', to: 'public/registrations#new'
  end
    devise_scope :admin do
    get 'admins/sign_in', to: 'admin/sessions#new'
    post 'admins/sign_in', to: 'admin/sessions#create'
    delete 'admins/sign_out', to: 'admin/sessions#destroy'
  end
  devise_for :customers, skip: :all
  devise_for :admins, skip: :all
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

  get "/homes/about" => "public/homes#about"
  root to: 'public/homes#top'
  get "/customers/my_page" => "public/customers#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
