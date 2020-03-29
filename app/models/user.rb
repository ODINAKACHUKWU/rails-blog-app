class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Model associations
  
  # Validations
  validates :first_name, presence: true, length: { minimum: 2, too_short: "%{count} characters is the minimum allowed" }, on: :create
  validates :last_name, presence: true, length: { minimum: 2, too_short: "%{count} characters is the minimum allowed" }, on: :create
  validates :password, presence: true, length: { in: 8..20 }, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'only allows valid emails' }, on: :create
end
