Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles do
    resources :comments, only: [:new, :create]
  end
  resources :comments, except: [:new, :create]
  resources :tags
  resources :users

  get '/logout' => 'sessions#destroy'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

end
