require 'rails_helper'

RSpec.describe "Landing Page", type: :request do
  describe "GET /" do
    it "returns a successful response" do
      get "/"
      expect(response).to have_http_status(:ok)
    end

    it "includes Sign Up and Login buttons in the response body" do
      get "/"
      expect(response.body).to include("Sign Up")
      expect(response.body).to include("Login")
    end
  end
end
