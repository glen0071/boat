class MoreFacilities < ActiveRecord::Migration[7.0]
  def change
    add_column :mn_doc_data, :work_release_facility, :integer
    add_column :mn_doc_data, :contract_facilities, :integer
    add_column :mn_doc_data, :work_crew_jail, :integer
    rename_column :mn_doc_data, :work_release_covod, :work_release_covid
  end
end
