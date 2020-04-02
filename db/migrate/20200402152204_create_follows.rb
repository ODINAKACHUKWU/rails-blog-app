class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.boolean :follow
      t.references :author, foreign_key: { to_table: 'users' }
      t.references :follower, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
