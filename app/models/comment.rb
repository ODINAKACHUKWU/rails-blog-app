class Comment < ApplicationRecord
  # Model associations
  belongs_to :article, class_name: "Article", foreign_key: :article_id
end
