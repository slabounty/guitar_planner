class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :planners, dependent: :destroy

  validates :email_address, presence: true, uniqueness: { case_sensitive: false }
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
