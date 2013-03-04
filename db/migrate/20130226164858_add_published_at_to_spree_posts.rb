class AddPublishedAtToSpreePosts < ActiveRecord::Migration
  def change
    add_column :spree_posts, :published_at, :datetime
  end
end
