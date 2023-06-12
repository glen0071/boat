class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :mn_doc_data, :american_indian, :native_american
    rename_column :mn_doc_data, :unknown_other, :unknown_other_race
    rename_column :mn_doc_data, :unknown_no_preference, :unknown_no_preference_religion
  end
end
