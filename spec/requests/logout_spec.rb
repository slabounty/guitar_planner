require 'rails_helper'

RSpec.describe "User Logout", type: :request do
  let!(:user) { User.create!(email_address: "test@example.com", password: "password", password_confirmation: "password") }

  before do
    post login_path, params: { email_address: "test@example.com", password: "password" }
  end

  it "logs the user out and clears session" do
    delete logout_path

    expect(response).to redirect_to(root_path)
    follow_redirect!
    expect(response.body).to include("Guitar Planner")
    expect(cookies[:session_id]).to be_blank
  end
end
