# frozen_string_literal: true

class AddGoodColumnOnQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :good, :boolean, default: false
  end
end
