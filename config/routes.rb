Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  # devise_for :authors
  root 'authors#index'

  resources :authors, only:[:index, :show] do
    resources :posts, only:[:index, :show] do
      resources :comments, only: [:create, :index, :new]
    end
  end
   # get 'posts/new', to: 'posts#new', as: 'new_post' # new
  resources :posts, only:[:create, :new, :edit, :destroy]
  resources :comments, only:[:edit, :destroy]
  post 'posts/:id/like', to: 'likes#index', as: 'like_action'
  # controller: 'posts', action: 'like'
  # , to: 'posts#like', as: 'like_post'
  # post 'comments', to: 'comments#create', as: 'comments'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
