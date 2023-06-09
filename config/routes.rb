Rails.application.routes.draw do

  root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:create, :show, :edit, :index, :update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
