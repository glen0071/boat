class AddSourceToBlogPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_posts, :source, :string
  end
end
