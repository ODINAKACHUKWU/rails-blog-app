class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.integer :read_time
      t.string :image_url
      t.boolean :published, default: false
      t.datetime :published_at
      t.bigint :comment_count, default: 0
      t.bigint :like_count, default: 0
      t.bigint :dislike_count, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
