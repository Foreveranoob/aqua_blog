Rails.application.routes.draw do

  get '/', to: 'welcome#index', as: 'home'
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
