Rails.application.routes.draw do
  resources :foods
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "users#index"

  resources :users do
    resources :recipes, only: [:index, :show, :destroy]
    resources :foods, only: [:index, :show, :new, :create, :destroy]
  end
end
