# spec/factories/planners.rb
FactoryBot.define do
  factory :planner do
    start_date { Date.today }
    technique { "Legato" }
    fretboard { "CAGED" }
    repertoire { "Autumn Leaves" }
    note { "Note about this week's plan" }
    user
  end
end
