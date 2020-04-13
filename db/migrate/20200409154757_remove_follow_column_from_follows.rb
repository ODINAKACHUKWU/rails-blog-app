class RemoveFollowColumnFromFollows < ActiveRecord::Migration[5.2]
  def change
    remove_column :follows, :follow, :boolean
  end
end
