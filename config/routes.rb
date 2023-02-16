Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "users/:user_id/posts", to: "posts#index", as: "user_posts"
  # get "users/:user_id/posts/:id", to: "posts#show", as: "user_post"
  # root "users#index" 
  # get "users/:id", to: "users#show", as: "user"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end
  # Defines the root path route ("/")
   root 'users#index'
end
