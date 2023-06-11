class AddStaff < ActiveRecord::Migration[7.0]
  def change
    add_column :mn_doc_data, :white_staff, :integer
    add_column :mn_doc_data, :black_staff, :integer
    add_column :mn_doc_data, :native_staff, :integer
    add_column :mn_doc_data, :asian_staff, :integer
    add_column :mn_doc_data, :hispanic_staff, :integer
    add_column :mn_doc_data, :total_staff, :integer
  end
end
