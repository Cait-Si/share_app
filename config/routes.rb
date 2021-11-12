Rails.application.routes.draw do
  get 'reserve_room/index'
  post 'reserve_room/confirm'
  get 'reserve_room/confirm'
  post 'reserve_room/show', to: 'reserve_room#create'
  get 'reserve_room/show'
  root 'rooms#top'
  get 'users/account'
  get 'users/profile'
  patch 'users/profile', to: 'users#update'
  get 'rooms/posts'
  post 'rooms/search/result', to: 'rooms#search'
  get 'rooms/search/result', to: 'rooms#search'
  resources :rooms
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
