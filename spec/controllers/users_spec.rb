# spec/requests/users_spec.rb

require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /signup" do
    it "renders the signup page" do
      get signup_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Sign Up") # or something unique on the page
    end
  end
end
