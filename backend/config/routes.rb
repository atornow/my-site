Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Your API endpoints will go here
      get "home/index"
    end
  end

  # Health check endpoint for CI/CD
  get "health_check", to: "home#index"
end
