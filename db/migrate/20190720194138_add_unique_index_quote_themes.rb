class AddUniqueIndexQuoteThemes < ActiveRecord::Migration[5.2]
  def change
    add_index :quote_themes, [:quote_id, :theme_id], unique: true
  end
end
