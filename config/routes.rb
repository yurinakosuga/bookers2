Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  
  resources :books, only: [:index, :show, :edit]
  resources :users, only: [:index, :show, :edit]
  
end
