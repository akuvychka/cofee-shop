Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products, only: :index
  resources :combos, only: :index
  resources :orders, only: %i[new create update destroy] do
    resources :products, only: %i[create destroy], controller: 'orders/products'
  end
end
