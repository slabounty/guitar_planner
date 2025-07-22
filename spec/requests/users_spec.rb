require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:email) { "test@example.com" }
  let(:password) { "password123" }

  before do
    post signup_path, params: {
      user: {
        email_address: email,
        password: password,
        password_confirmation: password
      }
    }
    follow_redirect! # follow redirect to user_home
  end

  describe "GET /user_home" do
    it "shows the user's home page with planners" do
      user = User.find_by(email_address: email)
      FactoryBot.create(:planner, user: user, technique: "Legato")

      get user_home_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Legato")
    end
  end
end
