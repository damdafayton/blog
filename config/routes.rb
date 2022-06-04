Rails.application.routes.draw do
  root 'users#index'
  resources :users, only:[:index, :show] do
    resources :posts, only:[:index, :show] do
      resources :comments, only: [:create]
    end
  end
   # get 'posts/new', to: 'posts#new', as: 'new_post' # new
  resources :posts, only:[:create, :new, :edit, :delete]
  resources :comments, only:[:new, :edit, :delete]
  post 'posts/:id/like', to: 'likes#index', as: 'like_action'
  # controller: 'posts', action: 'like'
  # , to: 'posts#like', as: 'like_post'
  # post 'comments', to: 'comments#create', as: 'comments'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
