class RemoveLikesCountFromArticles < ActiveRecord::Migration[5.2]
  def up
  	remove_column :articles, :likes_count, :integer
  end
end
