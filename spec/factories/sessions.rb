# spec/factories/sessions.rb
FactoryBot.define do
  factory :session do
    user
    user_agent { "RSpec Browser" }
    ip_address { "127.0.0.1" }
  end
end
