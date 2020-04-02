class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Mount Avatar uploader
  mount_uploader :avatar_url, ImageUploader

  # Model associations
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :followers, class_name: "Follow", foreign_key: :follower_id, dependent: :destroy
  has_many :followed_authors, class_name: "Follow", foreign_key: :author_id, dependent: :destroy
  
  # Validations
  validates :first_name, presence: true, length: { minimum: 2, too_short: "%{count} characters is the minimum allowed" }, on: :create
  validates :last_name, presence: true, length: { minimum: 2, too_short: "%{count} characters is the minimum allowed" }, on: :create
  validates :password, presence: true, length: { in: 8..20 }, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'only allows valid emails' }, on: :create
end
