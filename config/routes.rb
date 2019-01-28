Rails.application.routes.draw do
  devise_for :users
  root 'mercaries#index'
  get '/users/new'
end
