require "rails_helper"

RSpec.describe "Planners", type: :request do
  let(:email) { "planner@example.com" }
  let(:planner) { FactoryBot.create(:planner, user: @user) }

  before do
    @user = signup_and_login(email: email)
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
          technique: "Sweep Picking",
          fretboard: "Major Scale",
          repertoire: "Jazz Standard",
          note: "Note about this week's plan",
        }
      }

      expect(response).to redirect_to(user_home_path)
      follow_redirect!
      expect(response.body).to include("Sweep Picking")
    end
  end

  describe "DELETE /planners/:id" do
    let!(:planner) { FactoryBot.create(:planner, user: @user) }

    it "deletes the planner and redirects to user home" do
      expect {
        delete planner_path(planner)
      }.to change { @user.planners.count }.by(-1)

      expect(response).to redirect_to(user_home_path)
      follow_redirect!
      expect(response.body).to include("Planner deleted successfully")
    end
  end



  describe "GET /planners/:id/edit" do
    it "renders the edit form" do
      get edit_planner_path(planner)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Edit Practice Planner")
      expect(response.body).to include(planner.technique)
    end
  end

  describe "PATCH /planners/:id" do
    it "updates the planner and redirects to user home" do
      patch planner_path(planner), params: {
        planner: {
          technique: "Updated Technique",
          start_date: planner.start_date,
          fretboard: planner.fretboard,
          repertoire: planner.repertoire,
          note: planner.note,
        }
      }

      expect(response).to redirect_to(user_home_path)
      follow_redirect!
      expect(response.body).to include("Planner updated successfully")

      planner.reload
      expect(planner.technique).to eq("Updated Technique")
    end
  end
end
