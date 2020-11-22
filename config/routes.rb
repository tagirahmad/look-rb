Rails.application.routes.draw do
  resources :courses
  resources :authors
  resources :lessons
  resources :you_learns
  resources :categories

  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
