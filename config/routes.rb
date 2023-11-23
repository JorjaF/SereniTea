Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :customers, only: [:index, :create] do
    resources :subscriptions, only: [:index, :create, :destroy]
  end
end
