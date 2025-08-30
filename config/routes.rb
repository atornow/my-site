# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, skip: [ :registrations ]
  resources :thoughts

  # Avatar upload route
  patch "update_avatar", to: "application#update_avatar"

  root "thoughts#index" # Add this line
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
