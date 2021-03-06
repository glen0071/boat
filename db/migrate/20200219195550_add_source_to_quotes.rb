# frozen_string_literal: true

class AddSourceToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :quotes, :source, null: true, foreign_key: true
  end
end
