require "rails_helper"

RSpec.describe "Planners", type: :request do
  let(:email) { "planneruser@example.com" }
  let(:password) { "securepass123" }

  before do
    # Sign up the user and simulate real login
    post signup_path, params: {
      user: {
        email_address: email,
        password: password,
        password_confirmation: password
      }
    }
    follow_redirect! # to user_home
  end

  describe "GET /planners/new" do
    it "renders the new planner form" do
      get new_planner_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("New Practice Planner")
    end
  end

  describe "POST /planners" do
    it "creates a new planner and redirects to user home" do
      post planners_path, params: {
        planner: {
          start_date: Date.today,
          technique: "Arpeggios",
          fretboard: "Pentatonic",
          repertoire: "Minor Blues"
        }
      }

      expect(response).to redirect_to(user_home_path)

      follow_redirect!
      expect(response.body).to include("Arpeggios")
    end
  end
end
