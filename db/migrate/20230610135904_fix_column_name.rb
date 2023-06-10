class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :mn_doc_data, :females, :female
  end
end
