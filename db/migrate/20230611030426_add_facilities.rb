class AddFacilities < ActiveRecord::Migration[7.0]
  def change
    add_column :mn_doc_data, :stillwater_facility, :integer
    add_column :mn_doc_data, :st_cloud_facility, :integer
    add_column :mn_doc_data, :lino_lakes_facility, :integer
    add_column :mn_doc_data, :shakopee_facility, :integer
    add_column :mn_doc_data, :willow_river_facility, :integer
  end
end
