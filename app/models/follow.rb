class Follow < ApplicationRecord
  # Model associations
  belongs_to :author, class_name: "User"
  belongs_to :follower, class_name: "User"

  # Validations
  validates :author_id, presence: true
  validates :follower_id, presence: true
end
