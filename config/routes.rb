Rails.application.routes.draw do
  resources :inventory_foods
    devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  root "users#index"


    resources :recipes, only: [:index, :show, :destroy]
    resources :foods, only: [:index, :show, :new, :create, :destroy]
    resources :inventories, only: [:index, :show, :new, :create, :destroy] do
      resources :inventory_foods, only: [:index, :show, :new, :create, :destroy]
    end

  scope "/public" do
    get "/recipes", controller: :recipes, action: :public_recipes
  end

end
