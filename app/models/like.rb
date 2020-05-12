class Like < ApplicationRecord
  # Model associations
  belongs_to :user, foreign_key: :user_id
  belongs_to :article, foreign_key: :article_id

  # Validations
  validates :user_id, presence: true
  validates :article_id, presence: true
end
