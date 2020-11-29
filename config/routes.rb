Rails.application.routes.draw do
  resources :courses, :authors, :lessons, :you_learns, :categories

  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  # resources :categories  do
  #   get  'show_related_courses', on: :collection, param: :name
  # end

  get "/categories/related_classes/:name", to: "categories#show_related_courses"

end
