require 'rails_helper'

RSpec.describe "Landing Page", type: :request do
  describe "GET /" do
    it "renders the landing page" do
      get root_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Guitar Planner")
      expect(response.body).to include("Sign Up")
      expect(response.body).to include("Login")
    end
  end
end
