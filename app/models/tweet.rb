class Tweet < ApplicationRecord
  belongs_to :user

  validates :text, length: { maximum: 280 }, presence: true
end
