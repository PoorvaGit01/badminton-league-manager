Rails.application.routes.draw do
  root "players#index"

  resources :players, only: [:index, :new, :create, :destroy]
  resources :matches, only: [:index, :new, :create]

  get "leaderboard", to: "leaderboard#index"
end