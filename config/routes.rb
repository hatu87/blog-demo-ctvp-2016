Rails.application.routes.draw do
  resources :comments, only: [:create]
  resources :articles, only: [:index, :new, :create, :show, :edit, :update]

  get '/hello', to: 'hello#index'
  post '/hello', to: 'hello#say_hello'
end
