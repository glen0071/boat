class CreateQuoteThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :quote_themes do |t|
      t.references :theme, foreign_key: true
      t.references :quote, foreign_key: true

      t.timestamps
    end
  end
end
