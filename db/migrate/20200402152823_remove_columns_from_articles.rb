class RemoveColumnsFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :comment_count, :bigint
    remove_column :articles, :like_count, :bigint
    remove_column :articles, :dislike_count, :bigint
  end
end
