class AddPointsToQuoteTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :quote_topics, :points, :integer, null: false, default: 0
  end
end
