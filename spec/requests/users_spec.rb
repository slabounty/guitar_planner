require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:email) { "test@example.com" }

  before do
    @user = signup_and_login(email: email)
  end

  describe "GET /user_home" do
    it "shows the user's home page with planners" do
      FactoryBot.create(:planner, user: @user, technique: "Legato", technique_bpm: 75)

      get user_home_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Legato")
      expect(response.body).to include("75")
    end
  end
end
