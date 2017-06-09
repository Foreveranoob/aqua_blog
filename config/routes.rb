Rails.application.routes.draw do

  get '/', to: 'posts#index', as: 'home'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]

  # root "posts#index"

  resources :sessions, only: [:new, :create]do
    delete :destroy, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
