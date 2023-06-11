class AddFacility < ActiveRecord::Migration[7.0]
  def change
    add_column :mn_doc_data, :oak_park_heights_facility, :integer
    add_column :mn_doc_data, :red_wing_facility, :integer
    add_column :mn_doc_data, :faribault_facility, :integer
    add_column :mn_doc_data, :rush_city_facility, :integer
    add_column :mn_doc_data, :togo_facility, :integer
    add_column :mn_doc_data, :moose_lake_facility, :integer
  end
end
