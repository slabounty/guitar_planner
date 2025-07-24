# spec/views/users/show_spec.rb
require 'rails_helper'

RSpec.describe "users/show.html.erb" do
  before do
    assign(:user, User.new(email_address: "john.doe@example.com"))
    assign(:planners, [])
  end

  it "displays the user's email" do
    render
    expect(rendered).to match(/john.doe@example.com/)
  end

  context "when the user doesn't have planners" do
    it "let's the user know they don't have planners" do
      render
      expect(rendered).to match(/You don't have any planners yet/)
    end
  end

  context "when the user has planners" do
    before do
      assign(:planners, [ Planner.new(
        id: 123,
        start_date: Date.today,
        technique: "some technique",
        fretboard: "some fretboard",
        repertoire: "some repertoire",
        note: "some note",
      ) ])
    end

    it "shows the planners" do
      render
      expect(rendered).to match(/some technique/)
      expect(rendered).to match(/some fretboard/)
      expect(rendered).to match(/some repertoire/)
      expect(rendered).to match(/some note/)
    end
  end
end
