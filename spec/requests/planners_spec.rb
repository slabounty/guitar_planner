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
          technique_bpm: 60,
          fretboard: "Major Scale",
          fretboard_bpm: 62,
          repertoire: "Jazz Standard",
          repertoire_bpm: 70,
          note: "Note about this week's plan"
        }
      }

      expect(response).to redirect_to(user_home_path)
      follow_redirect!
      expect(response.body).to include("Sweep Picking")
      expect(response.body).to include("60")
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
      expect(response.body).to include(planner.technique_bpm.to_s)
    end
  end

  describe "PATCH /planners/:id" do
    it "updates the planner and redirects to user home" do
      patch planner_path(planner), params: {
        planner: {
          start_date: planner.start_date,
          technique: "Updated Technique",
          technique_bpm: 63,
          fretboard: planner.fretboard,
          fretboard_bpm: planner.fretboard_bpm,
          repertoire: planner.repertoire,
          repertoire_bpm: planner.repertoire_bpm,
          note: planner.note
        }
      }

      expect(response).to redirect_to(user_home_path)
      follow_redirect!
      expect(response.body).to include("Planner updated successfully")

      planner.reload
      expect(planner.technique).to eq("Updated Technique")
      expect(planner.technique_bpm).to eq(63)
    end
  end

  describe "POST /planners" do
    context "with invalid parameters (missing start_date)" do
      it "does not create a planner and re-renders the form" do
        expect {
          post planners_path, params: { planner: { start_date: nil, technique: "Alt picking", fretboard: "Modes", repertoire: "Canon in D" } }
        }.not_to change(Planner, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Start Date")
      end
    end
  end

  describe "PATCH /planners/:id" do
    let!(:planner) { FactoryBot.create(:planner, user: @user, start_date: Date.today) }

    context "with invalid parameters (missing start_date)" do
      it "does not update the planner and re-renders the form" do
        patch planner_path(planner), params: { planner: { start_date: nil } }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Start Date")
        expect(planner.reload.start_date).not_to be_nil
      end
    end
  end
end
