class RemoveSourceTitle < ActiveRecord::Migration[7.0]
  def change
    remove_column :quotes, :source_title
  end
end
