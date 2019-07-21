class AddRelevanceToQuoteTheme < ActiveRecord::Migration[5.2]
  def change
    add_column :quote_themes, :relevance, :integer
  end
end
