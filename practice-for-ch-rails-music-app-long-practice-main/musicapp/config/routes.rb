Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: redirect("404.html")
  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:new, :create, :edit, :update]


end
