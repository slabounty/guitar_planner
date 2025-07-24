# spec/factories/planners.rb
FactoryBot.define do
  factory :planner do
    start_date { Date.today }
    technique { "Legato" }
    fretboard { "CAGED" }
    repertoire { "Autumn Leaves" }
    user
  end
end
