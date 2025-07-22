require 'rails_helper'

RSpec.describe "User Login", type: :request do
  let(:email_address) { "test@example.com" }
  let(:today) { Date.today }
  let(:technique) { "technique 1"}
  let(:fretboard) { "fretboard 1"}
  let(:repertoire) { "repertoire 1"}
  let!(:user) { User.create!(email_address: email_address, password: "password", password_confirmation: "password") }
  let!(:planner_1) { Planner.create!(user_id: user.id, start_date: today, technique: technique, fretboard: fretboard, repertoire: repertoire) }

  describe "POST /login" do
    it "logs in the user and redirects to user home" do
      post login_path, params: {
        email_address: "test@example.com",
        password: "password"
      }

      expect(response).to redirect_to(user_home_path)

      follow_redirect!
      expect(response.body).to include("Welcome back")
      expect(response.body).to include(email_address)
      expect(response.body).to include(today.strftime("%B %d, %Y"))
      expect(response.body).to include(technique)
      expect(response.body).to include(fretboard)
      expect(response.body).to include(repertoire)
    end
  end
end
