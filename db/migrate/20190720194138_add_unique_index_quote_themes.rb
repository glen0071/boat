# frozen_string_literal: true

class AddUniqueIndexQuoteThemes < ActiveRecord::Migration[5.2]
  def change
    add_index :quote_themes, %i[quote_id theme_id], unique: true
  end
end
