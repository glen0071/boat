class AddIntensiveCommunitySupervision < ActiveRecord::Migration[7.0]
  def change
    add_column :mn_doc_data, :intensive_community_supervision, :integer
  end
end
