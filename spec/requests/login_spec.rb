require 'rails_helper'

RSpec.describe "User Login", type: :request do
  let!(:user) { User.create!(email_address: "test@example.com", password: "password", password_confirmation: "password") }

  describe "POST /login" do
    it "logs in the user and redirects to user home" do
      post login_path, params: {
        email_address: "test@example.com",
        password: "password"
      }

      expect(response).to redirect_to(user_home_path)

      follow_redirect!
      expect(response.body).to include("Welcome back")
    end
  end
end
