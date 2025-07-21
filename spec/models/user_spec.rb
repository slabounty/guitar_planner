require 'rails_helper'

RSpec.describe User, type: :model do
  let(:email_address) { "test@example.com" }
  let(:password) { "SomePassword123!" }
  let(:password_confirmation) { "SomePassword123!" }
  let(:user) { described_class.create(email_address: email_address, password: password, password_confirmation: password_confirmation) }

  describe '#email_address' do
    subject(:user_email_address) { user.email_address }

    it "has the correct email_address" do
      expect(user_email_address).to eq(email_address)
    end
  end
end
