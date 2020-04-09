class Like < ApplicationRecord
  # Model associations
  belongs_to :user, foreign_key: :user_id
  belongs_to :article, foreign_key: :article_id

  # Scopes
  scope :likes, -> { where(like: true) }
  scope :dislikes, -> { where(like: false) }
end
