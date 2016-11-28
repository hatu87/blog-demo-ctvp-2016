Rails.application.routes.draw do
  resources :articles, only: [:index, :new, :create, :show, :edit, :update] do
    resources :comments, only: [:create]
  end
  # get '/articles/:article_id/comments', to: 'comments#index'

  # get '/articles', to: 'articles#index'
  # post '/articles', to: 'articles#create'
  get '/hello', to: 'hello#index'
  post '/hello', to: 'hello#say_hello'
end
