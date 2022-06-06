Rails.application.routes.draw do
  root 'users#index'
  resources :authors, only:[:index, :show] do
    resources :posts, only:[:index, :show]
  end
  # resources :posts, only[:edit, :update, :destroy, :new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
