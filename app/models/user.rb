class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_many :tweets
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id"
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id"

  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


  mount_uploader :avatar, AvatarUploader
  validates :email, format: { with: VALID_EMAIL_REGEX, on: :create }, presence: true
  validates :first_name, :last_name, presence: true
  validates_confirmation_of :password, on: :create

  def following?(user)
    followings.find_by(id: user.id).present?
  end

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    followings.delete(followed: user)
  end
end
