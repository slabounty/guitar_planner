require 'rails_helper'

RSpec.describe "User Signup", type: :request do
  describe "POST /signup" do
    it "creates a new user and starts a session" do
      post signup_path, params: {
        user: {
          email_address: "new@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
      }

      # Pull session ID from database if needed
      user = User.find_by(email_address: "new@example.com")
      session = user.sessions.last
      expect(session).not_to be_nil

      follow_redirect!
      expect(response).to be_successful
      expect(response.body).to include("Welcome back")
    end
  end
end
