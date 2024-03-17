Rails.application.routes.draw do
     devise_for :users
  root to: 'homes#top'
  
  resources :users, only: [:index, :create, :edit, :show, :update] 
  resources :books, only: [:index, :new, :show, :create, :edit, :update, :destroy] 
  get "home/about" => "homes#about", as: "about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
