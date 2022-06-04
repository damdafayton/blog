Rails.application.routes.draw do
  root 'users#index'
  resources :users, only:[:index, :show] do
    resources :posts, only:[:index, :show]
  end
   # get 'posts/new', to: 'posts#new', as: 'new_post' # new
  resources :posts, only:[:create, :new, :edit, :delete]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
