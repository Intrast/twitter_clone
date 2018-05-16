class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_many :tweets

  validates :email, format: { with: VALID_EMAIL_REGEX, on: :create }, presence: true
  validates :first_name, :last_name, presence: true
  validates_confirmation_of :password
end
