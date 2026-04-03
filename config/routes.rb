Rails.application.routes.draw do
   root "leaderboard#index"

  resources :players, only: %i[index new create destroy]
  resources :matches, only: %i[index new create]
  resources :leaderboard, only: %i[index]
end
