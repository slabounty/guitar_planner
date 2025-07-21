require 'rails_helper'

RSpec.describe Planner, type: :model do
  let(:date) { Date.today }
  let(:technique) { "some technique" }
  let(:fretboard) { "some fretboard" }
  let(:repertoire) { "some repertoire" }
  let(:planner) { described_class.create(start_date: Date.today, technique: :technique, fretboard: :fretboard, repertoire: :repertoire) }

  describe '#start_date' do
    subject(:start_date) { planner.start_date }

    it "has the correct start_date" do
      expect(start_date).to eq(date)
    end
  end

  describe '#technique' do
    subject(:technique) { planner.technique }

    it "has the correct technique" do
      expect(technique).to eq(technique)
    end
  end

  describe '#fretboard' do
    subject(:fretboard) { planner.fretboard }

    it "has the correct fretboard" do
      expect(fretboard).to eq(fretboard)
    end
  end

  describe '#repertoire' do
    subject(:repertoire) { planner.repertoire }

    it "has the correct repertoire" do
      expect(repertoire).to eq(repertoire)
    end
  end
end
