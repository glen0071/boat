class AddLockedToSources < ActiveRecord::Migration[6.0]
  def change
    add_column :sources, :locked, :boolean, default: false
  end
end
