Rails.application.routes.draw do
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get "users/show" => "users#show"
  get "users" => "users#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
