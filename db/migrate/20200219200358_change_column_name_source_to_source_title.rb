# frozen_string_literal: true

class ChangeColumnNameSourceToSourceTitle < ActiveRecord::Migration[6.0]
  def change
    rename_column :quotes, :source, :source_title
  end
end
