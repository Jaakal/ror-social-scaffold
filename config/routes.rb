Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  get "invitation", to: "users#invitation", as: "invitations"

  resources :friendships, only: [:destroy]
  get "accept_as_a_friend/:user_id", to: "friendships#accept", as: "accept_as_a_friend"
  get "add_as_a_friend/:user_id", to: "friendships#create", as: "add_as_a_friend"
  get "decline_as_a_friend/:user_id", to: "friendships#destroy", as: "decline_as_a_friend"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
