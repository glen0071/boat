class AddToMnDocData < ActiveRecord::Migration[7.0]
  def change
    add_column :mn_doc_data, :burglary, :integer
    add_column :mn_doc_data, :larceny, :integer
    add_column :mn_doc_data, :robbery, :integer
  end
end
