class AddFields < ActiveRecord::Migration[7.0]
  def change
    add_column :mn_doc_data, :jewish, :integer
    add_column :mn_doc_data, :admissions_total, :integer
    add_column :mn_doc_data, :releases_total, :integer
  end
end
