Rails.application.routes.draw do
  resources :foods
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  root "users#index"


    resources :recipes, only: [:index, :show, :destroy]
    resources :foods, only: [:index, :show, :new, :create, :destroy]
    resources :inventories, only: [:index, :show, :new, :create, :destroy]

  scope "/public" do
    get "/recipes", controller: :recipes, action: :public_recipes
  end
end
