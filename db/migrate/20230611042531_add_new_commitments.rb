class AddNewCommitments < ActiveRecord::Migration[7.0]
  def change
    add_column :mn_doc_data, :total_new_commitment, :integer
  end
end
