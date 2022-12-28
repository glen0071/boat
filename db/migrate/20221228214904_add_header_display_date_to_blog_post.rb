class AddHeaderDisplayDateToBlogPost < ActiveRecord::Migration[7.0]
  def change
    add_column :blog_posts, :header, :text
    add_column :blog_posts, :display_date, :date
  end
end
