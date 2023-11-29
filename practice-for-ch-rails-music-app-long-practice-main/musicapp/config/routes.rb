Rails.application.routes.draw do
  resources :albums
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "bands#index"
  # get "/", to: redirect("404.html")
  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:new, :create, :edit, :update]
  resources :bands do
    resources :album, only: [:new, :create]
  end
  resources :albums, except: [:index]
end
