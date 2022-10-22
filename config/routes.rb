Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products, only: :index
  resources :combos, only: :index
  resources :orders, only: %i[new destroy] do
    resources :products, only: %i[update destroy]
  end
end
