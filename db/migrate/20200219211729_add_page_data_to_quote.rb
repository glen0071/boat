# frozen_string_literal: true

class AddPageDataToQuote < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :page, :string
  end
end
