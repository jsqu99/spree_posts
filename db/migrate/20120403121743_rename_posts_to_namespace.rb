class RenamePostsToNamespace < ActiveRecord::Migration
  def change
    rename_table :posts, :spree_posts
  end
end
