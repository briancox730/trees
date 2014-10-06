Rails.application.routes.draw do
  devise_for :lots
  root 'orders#index'
  resources :lots do
    collection do
      get 'open_orders'
    end
  end
  resources :zips
  resources :trees
  resources :available_trees
  resources :orders do
    collection do
      get 'zipcode_search'
      get 'order_confirmation'
      post 'order_claim'
      post 'order_release'
    end
  end
end
