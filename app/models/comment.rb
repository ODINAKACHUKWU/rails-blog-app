class Comment < ApplicationRecord
  # Model associations
  belongs_to :article, class_name: "Article", foreign_key: :article_id
  belongs_to :user, class_name: "User", foreign_key: :user_id

  # Validations
  validates :article_id, presence: true
  validates :user_id, presence: true
  validates :comment, presence: true
end
