# spec/factories/planners.rb
FactoryBot.define do
  factory :planner do
    start_date { Date.today }
    technique { "Legato" }
    technique_bpm { 60 }
    fretboard { "CAGED" }
    fretboard_bpm { 62 }
    repertoire { "Autumn Leaves" }
    repertoire_bpm { 70 }
    note { "Note about this week's plan" }
    user
  end
end
