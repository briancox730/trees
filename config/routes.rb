Rails.application.routes.draw do
  devise_for :lots
  root 'orders#index'
  resources :lots
  resources :zips
  resources :trees
  resources :available_trees
  resources :orders do
    collection do
      get 'zipcode_search'
    end
  end
end
