Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  end
  resources :users, only: [:index, :show, :edit, :update]
  
  get "home/about" => "homes#index"
end
