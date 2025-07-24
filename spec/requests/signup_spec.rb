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

  describe "POST /signup" do
    it "does not create user without email address" do
      expect {
        post signup_path, params: {
          user: {
            email_address: "", # Invalid
            password: "password123"
          }
        }
      }.not_to change(User, :count)

      expect(response.body).to match("Email address.*blank")
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "POST /signup" do
    it "does not allow duplicate email addresses" do
      FactoryBot.create(:user, email_address: "duplicate@example.com")

      expect {
        post signup_path, params: {
          user: {
            email_address: "duplicate@example.com",
            password: "anotherpassword"
          }
        }
      }.not_to change(User, :count)

      expect(response.body).to include("Email address has already been taken")
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
