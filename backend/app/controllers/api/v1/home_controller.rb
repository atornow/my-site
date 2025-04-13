module Api
  module V1
    class HomeController < ApplicationController
      def index
        render json: {message: "Welcome to My Site API", status: "OK"}
      end
    end
  end
end
