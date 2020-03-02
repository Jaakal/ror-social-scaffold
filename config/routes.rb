Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  resources :friendships, only: [:destroy]
  get "accept_as_a_friend", to: "friendships#accept"
  get "add_as_a_friend/:user_id", to: "friendships#create", as: "add_as_a_friend"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
