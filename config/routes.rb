Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    resources :following, only: %i(create destroy), controller: 'follow'
    resources :followings, only: %i(index), to: 'follow#index'
    resources :followers, only: %i(index), to: 'follow#follower_index'
  end
end
