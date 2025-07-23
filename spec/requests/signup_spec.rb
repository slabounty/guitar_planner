require "rails_helper"

RSpec.describe "User Signup", type: :request do
  let(:email) { "newuser@example.com" }
  let(:password) { "password123" }

  it "creates a new user and starts a session" do
    post signup_path, params: {
      user: {
        email_address: email,
        password: password,
        password_confirmation: password
      }
    }

    follow_redirect!

    expect(response).to have_http_status(:ok)
    expect(response.body).to include("Welcome back")

    user = User.find_by(email_address: email)
    expect(user).not_to be_nil
    expect(user.sessions.count).to eq(1)
  end
end
