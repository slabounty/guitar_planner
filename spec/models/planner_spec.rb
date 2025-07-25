require 'rails_helper'

RSpec.describe Planner, type: :model do
  let(:start_date) { Date.today }
  let(:technique) { "some technique" }
  let(:technique_bpm) { 60 }
  let(:fretboard) { "some fretboard" }
  let(:fretboard_bpm) { 62 }
  let(:repertoire) { "some repertoire" }
  let(:repertoire_bpm) { 70 }
  let(:note) { "some note" }
  let(:planner) { described_class.create(start_date: start_date,
                                         technique: technique, technique_bpm: technique_bpm,
                                         fretboard: fretboard, fretboard_bpm: fretboard_bpm,
                                         repertoire: repertoire, repertoire_bpm: repertoire_bpm,
                                         note: note) }

  describe '#start_date' do
    subject(:planner_start_date) { planner.start_date }

    it "has the correct start_date" do
      expect(planner_start_date).to eq(start_date)
    end
  end

  describe '#technique' do
    subject(:planner_technique) { planner.technique }

    it "has the correct technique" do
      expect(planner_technique).to eq(technique)
    end
  end

  describe '#fretboard' do
    subject(:planner_fretboard) { planner.fretboard }

    it "has the correct fretboard" do
      expect(planner_fretboard).to eq(fretboard)
    end
  end

  describe '#repertoire' do
    subject(:planner_repertoire) { planner.repertoire }

    it "has the correct repertoire" do
      expect(planner_repertoire).to eq(repertoire)
    end
  end

  describe '#note' do
    subject(:planner_note) { planner.note }

    it "has the correct note" do
      expect(planner_note).to eq(note)
    end
  end
end
