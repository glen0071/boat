class AddProtestantColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :mn_doc_data, :protestant, :integer
  end
end
