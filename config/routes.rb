Rails.application.routes.draw do
  root to: "welcome#index"

  get '/signup', to: "users#new"
  get '/signin', to: "session#new"
  delete '/signout', to: "session#destroy"
  resources :session
  resources :users
end
