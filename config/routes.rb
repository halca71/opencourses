Rails.application.routes.draw do
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'opencourses#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'adlogin', to: 'adlogin#new'
  post 'adlogin', to: 'adlogin#create'
  delete 'adlogout', to: 'adlogin#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create]
  
  resources :courses
  resources :categories, except: [:new, :show]
end
