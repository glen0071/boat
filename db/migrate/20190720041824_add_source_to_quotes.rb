# frozen_string_literal: true

class AddSourceToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :source, :string
    add_column :quotes, :source_link, :string
  end
end
