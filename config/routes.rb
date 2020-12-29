Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :courses, :authors, :lessons, :you_learns, :categories

  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  # resources :categories  do
  #   get  'show_related_courses', on: :collection, param: :name
  # end

  # mount RailsAdmin::Engine => "/admin", :as => "rails_admin"
  # devise_for :users
  # root :to => "rails_admin::Main#dashboard"

  # # https://github.com/sferik/rails_admin/issues/362
  # match ":controller(/:action(/:id(.:format)))"

  get "/categories/related_classes/:name", to: "categories#show_related_courses"
end
