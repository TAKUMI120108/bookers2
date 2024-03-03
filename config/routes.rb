Rails.application.routes.draw do
   get 'homes/top'
  resources :users, only: [:edit, :show] 
  resources :books, only: [:new, :index, :show] 
 
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end