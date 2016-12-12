Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :articles, only: [:index, :new, :create, :show, :edit, :update] do
    resources :comments, only: [:create]
  end
  # get '/articles/:article_id/comments', to: 'comments#index'

  # get '/articles', to: 'articles#index'
  # post '/articles', to: 'articles#create'
  get '/hello', to: 'hello#index'
  post '/hello', to: 'hello#say_hello'
end
