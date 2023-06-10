class ChangeColumnNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :mn_doc_data, :admissions_total, :total_admissions
    rename_column :mn_doc_data, :releases_total, :total_releases
  end
end
