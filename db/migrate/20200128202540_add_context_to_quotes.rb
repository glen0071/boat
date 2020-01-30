# frozen_string_literal: true

class AddContextToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :context, :string
  end
end
