Rails.application.routes.draw do
  get 'sessions/new'
  resources :users, only: [:new, :create, :show]
  resources :blogs
  resources :sessions, only: [:new, :create, :destroy]
end
