class MoreCounties < ActiveRecord::Migration[7.0]
  def change
    add_column :mn_doc_data, :anoka, :integer
    add_column :mn_doc_data, :washington, :integer
  end
end
