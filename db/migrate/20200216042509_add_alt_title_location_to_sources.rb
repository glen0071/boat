# frozen_string_literal: true

class AddAltTitleLocationToSources < ActiveRecord::Migration[6.0]
  def change
    add_column :sources, :alt_title, :string
    add_column :sources, :location, :string
    add_column :sources, :notes, :string
    rename_column :sources, :name, :title
  end
end
