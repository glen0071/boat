class AddMnLifers < ActiveRecord::Migration[7.0]
  def change
    add_column :mn_doc_data, :mn_lifers, :integer
    rename_column :mn_doc_data, :number_of_lifers, :total_lifers
  end
end
