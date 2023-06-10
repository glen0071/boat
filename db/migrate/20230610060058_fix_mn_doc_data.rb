class FixMnDocData < ActiveRecord::Migration[7.0]
  def change
    change_column :mn_doc_data, :average_age, :float
    change_column :mn_doc_data, :average_population, :float
  end
end
