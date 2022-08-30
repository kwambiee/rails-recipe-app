Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "users#index"

  resources :users,only:[:index, :show]
  resources :recipes, only: [:index, :show, :destroy]
  resources :foods, only: [:index, :show, :destroy, :new, :create, :edit, :update]

  scope "/public" do
    get "/recipes", controller: :recipes, action: :public_recipes
  end


end
