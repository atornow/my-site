require "rails_helper"

RSpec.describe "Api::V1::Homes", type: :request do
  describe "GET /api/v1/home/index" do
    it "returns a successful response" do
      get "/api/v1/home/index"
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json["message"]).to eq("Welcome to My Site API")
    end
  end
end
